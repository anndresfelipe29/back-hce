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

    function getListaRegistros()
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

    function setListaRegistros(RegistroMedico[] memory _listaRegistros) public {
        historiaClinicaStruct.listaRegistros = _listaRegistros;
    }

    function agregarRegistroMedico(RegistroMedico _registro) public {
        uint256 totalRegistros = historiaClinicaStruct.listaRegistros.length;
        _registro.setId(totalRegistros);
        historiaClinicaStruct.listaRegistros.push(_registro);
        // TODO: Puede registrarse aqui tambien para un mapper de registros médicos, lo que permitiria un analisis de todos los registros médicos
    }

    function eliminarRegistroMedico(uint256 index) external {
        if (index >= historiaClinicaStruct.listaRegistros.length) return;

        for (
            uint256 i = index;
            i < historiaClinicaStruct.listaRegistros.length - 1;
            i++
        ) {
            historiaClinicaStruct.listaRegistros[i] = historiaClinicaStruct
                .listaRegistros[i + 1];
        }
        historiaClinicaStruct.listaRegistros.pop();
    }

    function setEstado(EstadoHCEVO _estado) public {
        historiaClinicaStruct.estado = _estado;
    }
}
