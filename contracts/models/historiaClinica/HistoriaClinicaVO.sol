pragma solidity ^0.8.10;

import "./RegistroMedico.sol";
import "../VOGenerales/EstadoHCEVO.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract HistoriaClinicaVO {
    struct HistoriaClinicaStruct {
        int256 id;
        RegistroMedico[] listaRegistros;
        EstadoHCEVO estado;
    }

    HistoriaClinicaStruct private historiaClinicaStruct;

    function getId() public view returns (int256) {
        return historiaClinicaStruct.id;
    }

    function getListaResgistros()
        public
        view
        returns (RegistroMedico[] memory)
    {
        return historiaClinicaStruct.listaRegistros;
    }

    function getEstado() public view returns (EstadoHCEVO) {
        return historiaClinicaStruct.estado;
    }

    function setId(int256 _id) public {
        historiaClinicaStruct.id = _id;
    }

    function setListaResgistros(RegistroMedico[] memory _listaRegistros)
        public
    {
        historiaClinicaStruct.listaRegistros = _listaRegistros;
    }

    function setEstado(EstadoHCEVO _estado) public {
        historiaClinicaStruct.estado = _estado;
    }
}
