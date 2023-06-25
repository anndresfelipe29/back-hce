// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../logica/Acceso.sol";
import "../logica/AccesoHistoriaClinica.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Modifiers {
    address public creador;
    Acceso private acceso;
    AccesoHistoriaClinica private accesoHistoriaClinica;

    modifier tieneAcceso(uint256 permisoId) {
        bool esAccesible = acceso.validarPermisoDeRol(msg.sender, permisoId);
        require(
            esAccesible,
            string.concat(
                "El usuario no tiene acceso por rol a la funcion: ",
                Strings.toString(permisoId)
            )
        );
        // require(true, "El usuario no tiene acceso");
        _; // acá se ejecuta la función
    }

    modifier tienePermisoDeAccesoTemporal(address direccionPaciente) {
        if (direccionPaciente != msg.sender) {
            bool esAccesible = accesoHistoriaClinica.esSolicitudVigente(
                direccionPaciente,
                msg.sender
            );
            require(esAccesible, "El usuario no tiene acceso temporal");
        }

        _; // acá se ejecuta la función
    }

    modifier esMedicoActivoModifier() {
        bool esAccesible = accesoHistoriaClinica.esMedicoActivo(msg.sender);
        require(esAccesible, "El usuario no es un medico activo en el sistema nacional");
        _;
    }

    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    function setAcceso(Acceso _accesoAddress) public esPropietario {
        acceso = _accesoAddress;
    }

    function setAccesoHistoriaClinica(
        AccesoHistoriaClinica _accesoHistoriaClinicaAddress
    ) public esPropietario {
        accesoHistoriaClinica = _accesoHistoriaClinicaAddress;
    }

    // TODO: Quitar
    function getAcceso() public view returns (Acceso) {
        return acceso;
    }
    // TODO: Quitar
    function tieneAccesoFunc(uint256 permisoId) public returns (bool){
        return acceso.validarPermisoDeRol(msg.sender, permisoId);
    }
}
