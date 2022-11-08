// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "../logica/Acceso.sol";
import "../logica/AccesoHistoriaClinica.sol";

contract Modifiers {
    address public creador;
    Acceso private acceso;
    AccesoHistoriaClinica private accesoHistoriaClinica;

    modifier tieneAcceso(uint256 permisoId) {
        bool esAccesible = acceso.validarPermisoDeRol(msg.sender, permisoId);
        require(esAccesible, "El usuario no tiene acceso");
        // require(true, "El usuario no tiene acceso");
        _; // acá se ejecuta la función
    }

    modifier tienePermisoDeAccesoTemporal(address direccionPaciente) {
        if (direccionPaciente != msg.sender) {
            bool esAccesible = accesoHistoriaClinica.esSolicitudVigente(
                direccionPaciente,
                msg.sender
            );
            require(esAccesible, "El usuario no tiene acceso");
        }

        _; // acá se ejecuta la función
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

    function setAccesoHistoriaClinica(AccesoHistoriaClinica _accesoHistoriaClinicaAddress) public esPropietario {
        accesoHistoriaClinica = _accesoHistoriaClinicaAddress;
    }
}
