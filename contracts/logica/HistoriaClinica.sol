pragma solidity ^0.8.10;

import "../models/historiaClinica/HistoriaClinicaVO.sol";
import "../persistence/HistoriaClinicaMapper.sol";
import "../persistence/DatosParametricosMapper.sol";

// import "../persistence/HistoriaClinicaMapper.sol";

contract HistoriaClinica {
    address public creador;
    HistoriaClinicaMapperInterface private historiaClinicaMapper;
    DatosParametricosMapperInterface private datosParametricosMapper;

    constructor() {
        creador = msg.sender;
    }

    function inicializarHCE(address direccionPaciente) public {
        HistoriaClinicaVO nuevaHistoriaClinica = new HistoriaClinicaVO();
        // Llamar un estado del mapper de estados, y guardarlo
        EstadoHCEVO estadoHCE = datosParametricosMapper.consultarEstadoHCEVO(0);
        nuevaHistoriaClinica.setEstado(estadoHCE);
        historiaClinicaMapper.guardar(direccionPaciente, nuevaHistoriaClinica);
    }

    function agregarRegistro(address direccionPaciente, RegistroMedico registroMedico) public {
        registroMedico.setCodPrestadorServicioDeSalud(msg.sender);
        registroMedico.setFechaRegistro(block.timestamp);
        // TODO: Setear el tipo de registro médico desde el front
        // TODO: Falta definir el id
        HistoriaClinicaVO historiaClinica = historiaClinicaMapper.consultar(direccionPaciente);
        historiaClinica.agregarRegistroMedico(registroMedico);
    }

    function consultarRegistro(address direccionPaciente, uint256 idRegistro) public returns(RegistroMedico){
        HistoriaClinicaVO historiaClinica = historiaClinicaMapper.consultar(direccionPaciente);
        return historiaClinica.getListaRegistros()[idRegistro];
    }

    function eliminarRegistro(address direccionPaciente, uint256 idRegistro) public{
        HistoriaClinicaVO historiaClinica = historiaClinicaMapper.consultar(direccionPaciente);
        historiaClinica.eliminarRegistroMedico(idRegistro);
    }

    function registrosFiltradosPorFecha(address direccionPaciente, uint256 idRegistro) public returns(RegistroMedico[] memory){
        HistoriaClinicaVO historiaClinica = historiaClinicaMapper.consultar(direccionPaciente);
        return historiaClinica.getListaRegistros();
    }

    function registrosFiltradosPorTipo(address direccionPaciente, uint256 idRegistro) public{
        
    }

    // TODO: poner en clase generica y reusarlo
    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    function setHistoriaClinicaMapper(
        HistoriaClinicaMapperInterface _historiaClinicaMapper
    ) public esPropietario {
        historiaClinicaMapper = _historiaClinicaMapper;
    }

    function setDatosParametricosMapper(
        DatosParametricosMapperInterface _datosParametricosMapperAddress
    ) public esPropietario {
        datosParametricosMapper = _datosParametricosMapperAddress;
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }
}
