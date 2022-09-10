pragma solidity ^0.8.17;

import "./RegistroMedico.sol";
import "../VOGenerales/EstadoHCEVO.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract HistoriaClinicaVO {
    int256 private id;
    RegistroMedico[] private listaRegistros;
    EstadoHCEVO private estado;

    struct HistoriaClinicaStruct {
        int256 id;
        // RegistroMedico[] listaRegistros;
        uint256 estadoId;
    }

    function getHistoriaClinicaStruct()
        public
        view
        returns (HistoriaClinicaStruct memory)
    {
        return HistoriaClinicaStruct(id, estado.getId());
    }

    function setValuesOfHistoriaClinicaStruct(
        HistoriaClinicaStruct memory _historiaClinicaStruct,
        EstadoHCEVO estadoHCEVO
    ) public {
        id = _historiaClinicaStruct.id;
        estado = estadoHCEVO;
    }

    function getId() public view returns (int256) {
        return id;
    }

    function getListaRegistros() public view returns (RegistroMedico[] memory) {
        return listaRegistros;
    }

    function getEstado() public view returns (EstadoHCEVO) {
        return estado;
    }

    function setId(int256 _id) public {
        id = _id;
    }

    function setListaRegistros(RegistroMedico[] memory _listaRegistros) public {
        listaRegistros = _listaRegistros;
    }

    function agregarRegistroMedico(RegistroMedico _registro) public {
        uint256 totalRegistros = listaRegistros.length;
        _registro.setId(totalRegistros);
        listaRegistros.push(_registro);
        // TODO: Puede registrarse aqui tambien para un mapper de registros médicos, lo que permitiria un analisis de todos los registros médicos
    }

    function eliminarRegistroMedico(uint256 index) external {
        if (index >= listaRegistros.length) return;

        for (uint256 i = index; i < listaRegistros.length - 1; i++) {
            listaRegistros[i] = listaRegistros[i + 1];
        }
        listaRegistros.pop();
    }

    function setEstado(EstadoHCEVO _estado) public {
        estado = _estado;
    }
}
