pragma solidity ^0.8.10; // TODO: Ajustar la versión por consenso con José

import "../logica/Persona.sol";

contract MedicoService {
    address public creador;
    PersonaDAO private personaDao;

    constructor() public {
        creador = msg.sender; // creador del contrato
        personaDao = new PersonaDAO(); //TODO: verificar si queda guardado el objeto o si hay mejor manera
    }

    /*
    function verificarExistenciaEnSistemaExterno(address direccion) public returns (bool) {
        
        // TODO: acá va un oráculo
    }

    // TODO: buscar porque es uint256
    function buscarPerfilMedicoSistemaExterno(address direccion) public view returns (PerfilMedicoSistemaExternoStruct)    {
        // address direccion = msg.sender;
        // TODO: acá va un oráculo
    }
    */

    // TODO: buscar porque es uint256
    function registrar(address direccion, Medico.MedicoStruct memory medico ) public {
        // TODO: redefinir, acá le pega a persona dao y usa el método guardar
        // TODO: poner excepcion en caso de error
        // personaDao.guardar(direccion, medico);
    }

    // TODO: intentar volverlo view despues
    function consultar(address direccion) public returns (Medico.MedicoStruct memory) {
        // TODO: Validar que sea médico y sino lanzar excepción
        // TODO: mejorar o completar la conversion del tipo padre al hijo,preguntas al profe que se puede hacer
        // PersonaStruct memory persona = personaDao.consultar(direccion);
        Medico.MedicoStruct memory medico;
        //medico.setPrimerApellido(persona.getPrimerApellido());
        return medico;
    }
}
