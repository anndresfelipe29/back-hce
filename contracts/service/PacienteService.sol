// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

import "../persistence/PersonaDAO.sol";

contract PacienteService {
    address public creador;
    PersonaDAO private personaDao;

    constructor() public {
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
        personaDao.guardar(direccion, paciente);
    }

    // TODO: intentar dejarla como view
    function consultar(address direccion) public returns (Paciente) {
        // TODO: validar que sea paciente sino lanzar una excepcion
        // TODO: mejorar o completar la conversion del tipo padre al hijo,preguntas al profe que se puede hacer
        Persona persona = personaDao.consultar(direccion);
        Paciente paciente = new Paciente();
        paciente.setPrimerApellido(persona.getPrimerApellido());
        return paciente;
    }
}
