// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10; // TODO: Ajustar la versión por consenso con José

import "../logica/Persona.sol";

// import "../models/PersonaStruct.sol";

contract PersonaDAO {
    // Evento: envia una respuesta a un usuario, como un mensaje al parecer
    // event Log(address indexed user,  string data);
    event Log(string data);

    address public creador;

    mapping(address => Persona.PersonaStruct) public personas;

    constructor() public {
        creador = msg.sender; // creador del contrato
    }

    /*
    function existe(address direccion) public view returns (bool existe)
    {
        return personas[direccion]; // no sirve
    }
    */
    function consultar(address direccion)
        public
        returns (Persona.PersonaStruct memory)
    {
        // TODO: buscar persona en arreglo, ajustar para ver si existe el key en el mapping
        emit Log("entro a consultar");
        // bytes4(0x0) o !=0
        Persona.PersonaStruct memory persona = personas[direccion];
        if (!persona.isValue) {
            emit Log("no existe el usuario");
            revert("No existe ese paciente");
        }
        emit Log("usuario valido");
        return persona;
    }

    // TODO: buscar porque es uint256
    function guardar(address direccion, Persona.PersonaStruct memory persona) public {
        // TODO: quitar return en clase de enterprise architect
        // TODO: Validar, si falla poner excepción
        personas[direccion] = persona;
    }
}
