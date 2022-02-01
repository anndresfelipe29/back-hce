// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10; 
// import "../logica/Persona.sol";
import "../models/PersonaStruct.sol";

// TODO: hacer un name resgistry para validar que solo los contratos del proyecto y el propietario puedan acceder a las funciones
contract PersonaDAO {
    // event Log(address indexed user,  string data);
    event Log(string data);

    address public creador;

    mapping(address => PersonaStruct) private personas; // TODO: Dejar como private

    constructor() {
        creador = msg.sender;
    }

     // TODO: si no es external fallan los try catch, investigar al respecto
    function consultar(address direccion) 
        external
        returns (PersonaStruct memory)
    {
        emit Log("entro a consultar");
        PersonaStruct memory persona = personas[direccion];
        if (!persona.isValue) {
            emit Log("no existe el usuario");
            revert("No existe ese paciente");
        }
        emit Log("usuario valido");
        return persona;
    }

    function guardar(address direccion, PersonaStruct memory persona) public {
        // TODO: quitar return en clase de enterprise architect
        // TODO: Validar, si falla poner excepción
        if (personas[direccion].isValue) {
            emit Log("Ya existe una persona registrada con ese address");
            revert("Ya existe uan persona registrada con ese address");            
        }
        personas[direccion] = persona;
    }

    // TODO: agregar función actualizar
}
