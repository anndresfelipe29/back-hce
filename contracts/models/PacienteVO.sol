// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./Persona.sol";
import "./structsGenerales/DatosPersonalesStruct.sol";

contract PacienteVO is Persona {
    //
    uint256 private estadoId;
    DatosPersonalesStruct private datosPersonales;

    //uint256 private historiaClinicaId;  // TODO: sobra ya que hay un mapping que asocia una dirección con una historia clinica

    function getEstadoId() public view returns (uint256) {
        return estadoId;
    }

    function getDatosPersonales()
        public
        view
        returns (DatosPersonalesStruct memory)
    {
        return datosPersonales;
    }

    function setDatosPersonales(DatosPersonalesStruct memory _datosPersonales)
        public
    {
        datosPersonales = _datosPersonales;
    }

    function setEstadoId(uint256 _estadoId) public {
        estadoId = _estadoId;
    }
}
