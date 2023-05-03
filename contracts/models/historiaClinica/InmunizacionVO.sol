// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";


contract InmunizacionVO is RegistroMedico (TipoRegistroMedico.INMUNIZACIONVO) {
    struct InmunizacionStruct {
        VacunaStruct inmunizacion;
        int256 fechaAplicacion;
    }

    struct VacunaStruct {
        string nombre;
        string descripcion;
    }

    InmunizacionStruct private inmunizacionStruct;

    function getInmunizacion() public view returns (VacunaStruct memory) {
        return inmunizacionStruct.inmunizacion;
    }

    function getFechaAplicacion() public view returns (int256) {
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

    function setFechaAplicacion(int256 _fechaAplicacion) public {
        inmunizacionStruct.fechaAplicacion = _fechaAplicacion;
    }
}
