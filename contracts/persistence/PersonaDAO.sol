// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10; // TODO: Ajustar la versión por consenso con José
// import "../logica/Persona.sol";
import "../models/PersonaStruct.sol";

contract PersonaDAO {
    // event Log(address indexed user,  string data);
    event Log(string data);

    address public creador;

    mapping(address => PersonaStruct) public personas; // TODO: Dejar como private

    // TODO: convertir en singleton
    constructor() public {
        creador = msg.sender; // creador del contrato
    }

    function consultar(address direccion)
        public
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
            emit Log("Ya existe uan persona registrada con ese address");
            revert("Ya existe uan persona registrada con ese address");            
        }
        personas[direccion] = persona;
    }

    // TODO: agregar función actualizar}
}
