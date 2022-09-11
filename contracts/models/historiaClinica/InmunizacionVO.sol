// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";


contract InmunizacionVO is RegistroMedico {
    struct InmunizacionStruct {
        VacunaStruct inmunizacion;
        uint256 fechaAplicacion;
    }

    struct VacunaStruct {
        string nombre;
        string descripcion;
    }

    InmunizacionStruct private inmunizacionStruct;

    function getInmunizacion() public view returns (VacunaStruct memory) {
        return inmunizacionStruct.inmunizacion;
    }

    function getFechaAplicacion() public view returns (uint256) {
        return inmunizacionStruct.fechaAplicacion;
    }

    function getInmunizacionStruct()
        public
        view
        returns (InmunizacionStruct memory)
    {
        return inmunizacionStruct;
    }

    function setInmunizacionStruct(
        InmunizacionStruct memory _inmunizacionStruct
    ) public {
        inmunizacionStruct = _inmunizacionStruct;
    }

    function setInmunizacion(VacunaStruct memory _inmunizacion) public {
        inmunizacionStruct.inmunizacion = _inmunizacion;
    }

    function setFechaAplicacion(uint256 _fechaAplicacion) public {
        inmunizacionStruct.fechaAplicacion = _fechaAplicacion;
    }
}
