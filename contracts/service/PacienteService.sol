// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

import "../persistence/PersonaDAO.sol";
import "../logica/Paciente.sol";

// TODO: quizá todos los métodos en los service deban ser external (averiguar)
// https://ethereum.stackexchange.com/questions/19380/external-vs-public-best-practices?answertab=active#tab-top
contract PacienteService {

    event Log(string data);

    address public creador;
    PersonaDAO private personaDao;

    constructor() {
        creador = msg.sender; // creador del contrato
        personaDao = new PersonaDAO(); //TODO: verificar si queda guardado el objeto o si hay mejor manera
    }

    function activar() public returns (bool) {
        address direccion = msg.sender;
        // TODO: buscar persona en arreglo
    }

    // TODO: buscar porque es uint256
    function registrar(address direccion, Paciente paciente) public {
        // TODO: poner excepcion en caso de error
        // personaDao.guardar(direccion, paciente);
    }

    // TODO: intentar dejarla como view
    // TODO: Cambiar a paciente
    function consultar(address direccion) external returns (PersonaStruct memory) {
        // TODO: validar que sea paciente sino lanzar una excepcion
        // TODO: mejorar o completar la conversion del tipo padre al hijo,preguntas al profe que se puede hacer
        emit Log("entro a consultar");
        try personaDao.consultar(direccion) returns (PersonaStruct memory persona) {
            // Paciente paciente = new Paciente();
            // paciente.setPrimerApellido(persona.getPrimerApellido()); // acá se rompe
            emit Log("encontro la persona");            
            return persona;
        } catch Error(string memory /*reason*/){
            emit Log("se rompio por un revert o require");
        }  catch (bytes memory /*lowLevelData*/){
            emit Log("se rompio y ni idea porque ");
        }      
    }
}
