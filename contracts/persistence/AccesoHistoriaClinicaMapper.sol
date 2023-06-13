// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./AccesoHistoriaClinicaMapperInterface.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "../utils/Utils.sol";

contract AccesoHistoriaClinicaMapper is AccesoHistoriaClinicaMapperInterface {

    address public creador;

    // TODO: Actualizar clase en enterprise architect

    mapping(string => PermisoDeAccesoVO[]) private permisosDeAccesoTemporal;
    mapping(address => string[]) private permisosDeAccesoMedico;
    mapping(address => string[]) private permisosDeAccesoHistoriaClinica;
    string[] private indices;

    constructor() {
        creador = msg.sender;
    }

    function setPermiso(
        address direccionPaciente,
        address direccionMedico,
        PermisoDeAccesoVO permiso
    ) external returns (uint256) {
        // https://dev.to/hannudaniel/concatenate-two-strings-on-the-blockchain-using-solidity-smart-contracts-new-feature-in-v0812-549g
        string memory llave = crearLlave(direccionPaciente, direccionMedico);
        /*
        bool hayPermisoVigente = this.esPermisoVigente(direccionPaciente, direccionMedico);
        if (hayPermisoVigente) {
            revert("Ya existe un permiso activo");
        }
        */
        PermisoDeAccesoVO[] storage permisos = permisosDeAccesoTemporal[llave];

        if (permisos.length > 0) {
            PermisoDeAccesoVO[]
                memory permisosinvalidos = filtroPermisosDeAccesoActivos(
                    permisos
                );

            if (permisosinvalidos.length > 0) {
                revert("Ya existe un permiso activo");
            }

            permisosinvalidos = filtroPermisosDeAccesoPendientes(permisos);

            if (permisosinvalidos.length > 0) {
                revert("Ya existe un permiso pendiente de responder");
            }
        }

        // TODO: Validar si hay una solicitud en curso (Estado false)

        permiso.setPaciente(direccionPaciente);
        permiso.setSolicitante(direccionMedico);

        permisos.push(permiso);        

        string[]
            storage listaDeLlavesHistoriaClinica = permisosDeAccesoHistoriaClinica[
                direccionPaciente
            ];
        if (!existeLlaveEnLista(llave, listaDeLlavesHistoriaClinica)) {
            listaDeLlavesHistoriaClinica.push(llave);
        }
        string[] storage listaDeLlavesMedico = permisosDeAccesoMedico[
            direccionMedico
        ];
        if (!existeLlaveEnLista(llave, listaDeLlavesMedico)) {
            listaDeLlavesMedico.push(llave);
        }

        uint256 id = indices.length;
        indices.push(llave);
        
        permiso.setId(id);
        permiso.setLlave(llave);
        return id;
    }

    function getPermisosDeAccesoActivosPorHistoriaClinica(address direccion)
        external
        view
        returns (PermisoDeAccesoVO[] memory response)
    {
        PermisoDeAccesoVO[] memory permisosHistoriaClinica = this
            .getPermisosDeAccesoPorHistoriaClinica(direccion);
        return filtroPermisosDeAccesoActivos(permisosHistoriaClinica);
    }

    // MELA, probar
    function getPermisosDeAccesoPorHistoriaClinica(address direccion)
        public
        view
        returns (PermisoDeAccesoVO[] memory)
    {
        string[] storage listaDeLlaves = permisosDeAccesoHistoriaClinica[
            direccion
        ];
        // TODO If y return si es 0
        PermisoDeAccesoVO[] memory response = new PermisoDeAccesoVO[](
            listaDeLlaves.length
        );

        for (uint256 i = listaDeLlaves.length; i > 0; i--) {
            string memory llave = listaDeLlaves[i - 1];
            PermisoDeAccesoVO[]
                memory historialDePermisos = permisosDeAccesoTemporal[llave];
            PermisoDeAccesoVO permisoMasReciente = historialDePermisos[
                historialDePermisos.length - 1
            ];
            // ajustar orden del response descendente
            response[i - 1] = permisoMasReciente;
        }
        return response;
    }

    function esPermisoVigente(
        address direccionPaciente,
        address direccionMedico
    ) external view returns (bool) {
        string memory llave = crearLlave(direccionPaciente, direccionMedico);
        PermisoDeAccesoVO[] storage permisos = permisosDeAccesoTemporal[llave];
        PermisoDeAccesoVO[]
            memory permisosActivos = filtroPermisosDeAccesoActivos(permisos);
        if (permisosActivos.length > 0) {
            return true;
        } else {
            return false;
        }
    }

    function getPermisosDeAccesoActivosPorMedico(address direccion)
        external
        view
        returns (PermisoDeAccesoVO[] memory response)
    {
        PermisoDeAccesoVO[] memory permisosHistoriaClinica = this
            .getPermisosDeAccesoPorHistoriaClinica(direccion);
        return filtroPermisosDeAccesoActivos(permisosHistoriaClinica);
    }

    // TODO
    function getPermisosDeAccesoPorMedico(address direccion)
        external
        view
        returns (PermisoDeAccesoVO[] memory)
    {
        string[] storage listaDeLlaves = permisosDeAccesoMedico[direccion];

        PermisoDeAccesoVO[] memory response = new PermisoDeAccesoVO[](
            listaDeLlaves.length
        );

        for (uint256 i = listaDeLlaves.length; i > 0; i--) {
            string memory llave = listaDeLlaves[i - 1];
            PermisoDeAccesoVO[]
                memory historialDePermisos = permisosDeAccesoTemporal[llave];
            PermisoDeAccesoVO permisoMasReciente = historialDePermisos[
                historialDePermisos.length - 1
            ];
            response[i - 1] = permisoMasReciente;
        }
        return response;
    }

    function getPermisos(address direccionPaciente, address direccionMedico)
        external
        view
        returns (PermisoDeAccesoVO[] memory)
    {
        string memory llave = crearLlave(direccionPaciente, direccionMedico);
        return permisosDeAccesoTemporal[llave];
    }

    /* internal*/
    function filtroPermisosDeAccesoActivos(PermisoDeAccesoVO[] memory permisos)
        public
        view
        returns (PermisoDeAccesoVO[] memory)
    {
        uint256 size = 0;
        for (uint256 i = 0; i < permisos.length; i++) {
            if (uint256(permisos[i].getFechaExpiracion()) > block.timestamp) {
                size++;
            }
        }

        if (size == 0) {
            return new PermisoDeAccesoVO[](0);
        }
        PermisoDeAccesoVO[] memory response = new PermisoDeAccesoVO[](size);
        uint256 index = 0;
        for (uint256 i = 0; i < permisos.length; i++) {
            if (uint256(permisos[i].getFechaExpiracion()) > block.timestamp) {
                response[index] = permisos[i];
                index++;
            }
        }
        return response;
    }

        /* internal*/
    function filtroPermisosDeAccesoPendientes(PermisoDeAccesoVO[] memory permisos)
        public
        view
        returns (PermisoDeAccesoVO[] memory)
    {
        uint256 size = 0;
        for (uint256 i = 0; i < permisos.length; i++) {
            if (!permisos[i].getFueRespondido()) {
                size++;
            }
        }

        if (size == 0) {
            return new PermisoDeAccesoVO[](0);
        }
        PermisoDeAccesoVO[] memory response = new PermisoDeAccesoVO[](size);
        uint256 index = 0;
        for (uint256 i = 0; i < permisos.length; i++) {
            if (!permisos[i].getFueRespondido()) {
                response[index] = permisos[i];
                index++;
            }
        }
        return response;
    }

    /* internal*/
    function crearLlave(address direccionPaciente, address direccionMedico)
        public
        pure
        returns (string memory)
    {
        return
            string.concat(
                string.concat(Strings.toHexString(direccionPaciente), "-"),
                Strings.toHexString(direccionMedico)
            );
    }

    // Un medico verifica si tiene x HC en su lista (solo para uso interno)
    function existeLlaveEnLista(
        string memory llave,
        string[] memory listDeLlaves
    ) internal pure returns (bool) {
        for (uint256 i = listDeLlaves.length; i > 0; i--) {
            if (Utils.compareStrings(listDeLlaves[i - 1], llave)) {
                return true;
            }
        }
        return false;
    }

    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }
}
