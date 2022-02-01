// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10; 

import "../logica/Persona.sol";

contract AccesoService {
    event Log(string data);
    address public creador;
    address public ContratoPersonaAddress;
    Persona private contratoPersona;

    constructor() {
        creador = msg.sender; // creador del contrato       
    }

    function login() external returns (PersonaStruct memory) {
        address direccionUsuario = msg.sender;
        // TODO: buscar persona en arreglo        ;
        try contratoPersona.consultar(direccionUsuario) returns (
            PersonaStruct memory response
        ) {
            emit Log("encontro la persona");
            return response;
        } catch Error(string memory e) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(e);
            revert("No existe ese usuario");
        }
    }

    /*
    // TODO: buscar porque es uint256
    function buscarPermisosDeRol(uint256 funcionId) public view returns(bool){
        address direccion = msg.sender;
        // TODO: esto es como un filtro (averiguar si lo hay en solidity) y sirve para ver si un usario tiene acceso a x metodo
    }
    */

function setContratoPersonaAddress(address direccion) public esPropietario {
        ContratoPersonaAddress = direccion;
        contratoPersona = Persona(ContratoPersonaAddress);
    }

    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }
}
