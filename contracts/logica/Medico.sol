pragma solidity ^0.8.10;

import "../models/MedicoVO.sol";
import "../persistence/MedicoMapper.sol";

contract Medico {
    // TODO: consumir este evento desde una clase heredada o algo así
    event Log(string data);
    address public creador;
    address public medicoMapperAddress;

    MedicoMapperInterface private medicoMapper;

    struct PerfilMedicoSistemaExternoStruct {
        string primerNombre;
        string segundoNombre;
        string primerApellido;
        string segundoApellido;
        string identificacion; // TODO: agregar tipo de identificacion
        string especialidad;
    }

    constructor() {
        creador = msg.sender; // creador del contrato
    }

    function consultar(address direccion) public returns (MedicoVO.MedicoVOStruct memory) {
        emit Log("entro a consultar");
        return medicoMapper.consultar(direccion).getMedicoVOValue();
    }

    function registrar(address direccion, MedicoVO medico) public {
        try medicoMapper.guardar(direccion, medico) {
            emit Log("Se guarda la informacion del medico correctamente");
        } catch Error(string memory data) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(data);
        }
    }

    function actualizar(address direccion, MedicoVO medico) public {
        medicoMapper.actualizar(direccion, medico);
        /*
        try contratoPacienteDAO.actualizar(direccion, paciente) {
            emit Log("Se guarda la informacion de paciente correctamente");
        } catch Error(string memory data) {
            /*reason*/
        /*  emit Log("se rompio por un revert o require");
            emit Log(data);
        }*/
    }

    function verificarExistenciaEnSistemaExterno(address direccion)
        public
        returns (bool)
    {
        /* TODO: Consultar info del medico (usuario y contraseña)
         *  despues se hace con oraculos una consulta
         */
        return true;
    }

    /*function buscarPerfilMedicoSistemaExterno(address direccion) public returns (PerfilMedicoSistemaExternoStruct memory){
        // TODO: tambien con oraculo
    }*/

    function setContratoPacienteMapperAddress(address _medicoMapperAddress)
        public
        esPropietario
    {
        medicoMapperAddress = _medicoMapperAddress;
        medicoMapper = MedicoMapper(medicoMapperAddress); // TODO: quizá es mejor recibir el objeto como contrato
    }

    // TODO: poner en clase generica y reusarlo
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
