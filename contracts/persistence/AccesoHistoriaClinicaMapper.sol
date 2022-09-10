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

    // Un medico verifica si tiene x HC en su lista (solo para uso interno)
    function existeLlaveEnLista(string memory llave, string[] memory listDeLlaves)
        internal
        returns (bool)
    {
        for (uint256 i = listDeLlaves.length - 1; i >= 0; i--) {            
            if(Utils.compareStrings(listDeLlaves[i], llave)){
                return true;
            }
            return true;
        }
        return false;
    }

    function setPermiso(
        address direccionPaciente,
        address direccionMedico,
        PermisoDeAccesoVO permiso
    ) external returns (uint256) {
        // https://dev.to/hannudaniel/concatenate-two-strings-on-the-blockchain-using-solidity-smart-contracts-new-feature-in-v0812-549g
        string memory llave = crearLlave(
            direccionPaciente,
            direccionMedico
        );

        bool hayPermisoVigente = this.esPermisoVigente(
            direccionPaciente,
            direccionMedico
        );
        if (hayPermisoVigente) {
            revert("Ya existe un permiso activo");
        }

        PermisoDeAccesoVO[] storage permisos = permisosDeAccesoTemporal[llave] ;
        permisos.push(permiso);
        
        string[] storage listaDeLlavesHistoriaClinica = permisosDeAccesoHistoriaClinica[direccionPaciente];
        if(!existeLlaveEnLista(llave, listaDeLlavesHistoriaClinica)) {
            listaDeLlavesHistoriaClinica.push(llave);
        }
        string[] storage listaDeLlavesMedico = permisosDeAccesoMedico[direccionMedico];
        if(!existeLlaveEnLista(llave, listaDeLlavesMedico)) {
            listaDeLlavesMedico.push(llave);
        }       

        uint256 id = indices.length;
        indices.push(llave);
        // TODO: Agregar id y llave al objeto
        return id;
    }

    // MELA, probar
    function getPermisosDeAccesoPorHistoriaClinica(address direccion)
        external
        returns (PermisoDeAccesoVO[] memory response)
    {
        string[] storage listaDeLlaves = permisosDeAccesoHistoriaClinica[direccion];   
        for (uint256 i = listaDeLlaves.length - 1; i >= 0; i--) {
            string memory llave = listaDeLlaves[i];
            PermisoDeAccesoVO[] historialDePermisos = permisosDeAccesoTemporal[llave];            
            PermisoDeAccesoVO permisoMasReciente = historialDePermisos[historialDePermisos.length-1];
            response.push( permisoMasReciente );
        }
        return response;
    }

        // TODO
        function getPermisosDeAccesoActivos(address direccion)
        external
        returns (PermisoDeAccesoVO[] memory response)
    {
        string[] storage listaDeLlaves = permisosDeAccesoHistoriaClinica[direccion];   
        for (uint256 i = listaDeLlaves.length - 1; i >= 0; i--) {
            string memory llave = listaDeLlaves[i];
            PermisoDeAccesoVO[] historialDePermisos = permisosDeAccesoTemporal[llave];
            historialDePermisos[historialDePermisos.length-1];
            if(esPermisoVigente(llave)) {
                response.push( permiso )
            }
            
            
            
            return true;
        }
        return permisosDeAccesoHistoriaClinica[direccion];
    }

    function getPermisosDeAccesoPorMedico(address direccion)
        external
        returns (PermisoDeAccesoVO[] memory)
    {
        return permisosDeAccesoMedico[direccion];
    }

    function getPermisos(address direccionPaciente, address direccionMedico)
        external
        returns (PermisoDeAccesoVO[] memory)
    {
        string memory llave = this.crearLlave(
            direccionPaciente,
            direccionMedico
        );
        return permisosDeAccesoTemporal[llave];
    }

    function esPermisoVigente(
        string llave
    ) external returns (bool) {
        return true;
    }

    function crearLlave(address direccionPaciente, address direccionMedico)
        internal
        returns (string memory)
    {
        return
            string.concat(
                string.concat(Strings.toHexString(direccionPaciente), "-"),
                Strings.toHexString(direccionMedico)
            );
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
