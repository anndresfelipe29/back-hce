// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

// import "../persistence/PersonaDAO.sol";
import "../logica/Paciente.sol";
import "./AccesoService.sol";

// TODO: quizá todos los métodos en los service deban ser external (averiguar)
// https://ethereum.stackexchange.com/questions/19380/external-vs-public-best-practices?answertab=active#tab-top
contract PacienteService {
    event Log(string data);

    address public creador;
    AccesoService private contratoAccesoService;
    Paciente private contratoPaciente;

    constructor() {
        creador = msg.sender; // creador del contrato
    }

    // TODO: validar que sea un medico
    function cambiarEstado(address direccion, string estado) public esMedico returns (bool) {
        // TODO: buscar persona en arreglo
        Paciente.PersonaPacienteStruct pacienteInfo =contratoPaciente.consultar(direccion);
        pacienteInfo.paciente.estado = estado;
        contratoPaciente.registrar(direccion, pacienteInfo.paciente);
    }

    // TODO: buscar porque es uint256
    function registrar(address direccion, Paciente paciente) public {
        // TODO: poner excepcion en caso de error
        // personaDao.guardar(direccion, paciente);
    }

    // TODO: intentar dejarla como view
    // TODO: Cambiar a paciente
    // TODO: validar si consulta su propia informacion o es medico
    function consultar(address direccion)
        external
        returns (PersonaStruct memory)
    {
        // TODO: validar que sea paciente sino lanzar una excepcion
        // TODO: mejorar o completar la conversion del tipo padre al hijo,preguntas al profe que se puede hacer
        emit Log("entro a consultar");
        try personaDao.consultar(direccion) returns (
            PersonaStruct memory persona
        ) {
            // Paciente paciente = new Paciente();
            // paciente.setPrimerApellido(persona.getPrimerApellido()); // acá se rompe
            emit Log("encontro la persona");
            return persona;
        } catch Error(
            string memory /*reason*/
        ) {
            emit Log("se rompio por un revert o require");
        } catch (
            bytes memory /*lowLevelData*/
        ) {
            emit Log("se rompio y ni idea porque ");
        }
    }

    modifier esMedico() {
        uint256 rolId = contratoAccesoService.consultarRol(msg.sender);
        require(
            rolId == 1,
            "Esta funcion solo puede ser ejecutada por un medico"
        );
        _;
    }

    modifier esPropietario() {
        // NOTE: Los string no pueden llevar acentos, encontrar una forma de usarlos
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }
}
