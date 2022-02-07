pragma solidity ^0.8.10;

import "./Persona.sol";
// import "./Usuario.sol";
import "../models/PersonaStruct.sol";
import "../models/MedicoStruct.sol";
import "../persistence/MedicoDAO.sol";

// TODO: cambiar el diagrama, no puede heredar pero si puede usar o componerse de persona
contract Medico {
    // TODO: consumir este evento desde una clase heredada o algo así
    event Log(string data);
    address public creador;
    address public ContratoMedicoDAOAddress;
    address public ContratoPersonaAddress;

    MedicoDAO private contratoMedicoDAO;
    Persona private contratoPersona;

    struct PersonaMedicoStruct {
        PersonaStruct persona;
        MedicoStruct medico;
    }

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

    function consultar(address direccion)
        public
        returns (PersonaMedicoStruct memory medicoInfo)
    {
        emit Log("entro a consultar");
        medicoInfo.medico = consultarMedico(direccion);
        medicoInfo.persona = consultarPersona(direccion);
    }

    function consultarMedico(address direccion)
        public
        returns (MedicoStruct memory)
    {
        emit Log("entro a consultar Paciente");
        try contratoMedicoDAO.consultar(direccion) returns (
            MedicoStruct memory response
        ) {
            emit Log("encontro el medico");
            return response;
        } catch Error(string memory e) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(e);
            revert("No existe ese medico");
        }
    }

    function consultarPersona(address direccion)
        public
        returns (PersonaStruct memory)
    {
        emit Log("entro a consultar");
        try contratoPersona.consultar(direccion) returns (
            PersonaStruct memory response
        ) {
            emit Log("encontro la persona");
            return response;
        } catch Error(string memory e) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(e);
            revert("No existe ese paciente");
        }
    }

    function registrar(address direccion, MedicoStruct memory medico) public {
        try contratoMedicoDAO.guardar(direccion, medico) {
            emit Log("Se guarda la informacion del medico correctamente");
        } catch Error(string memory data) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(data);
        }
    }

    function verificarExistenciaEnSistemaExterno(address direccion) public returns (bool) {
        /* TODO: Consultar info del medico (usuario y contraseña)
        *  despues se hace con oraculos una consulta
        */
        return true;
    }

    /*function buscarPerfilMedicoSistemaExterno(address direccion) public returns (PerfilMedicoSistemaExternoStruct memory){
        // TODO: tambien con oraculo
    }*/


    function setContratoPersonaAddress(address direccion) public esPropietario {
        ContratoPersonaAddress = direccion;
        contratoPersona = Persona(ContratoPersonaAddress);
    }

    function setContratoPacienteDAOAddress(address direccion)
        public
        esPropietario
    {
        ContratoMedicoDAOAddress = direccion;
        contratoMedicoDAO = MedicoDAO(ContratoMedicoDAOAddress);
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
