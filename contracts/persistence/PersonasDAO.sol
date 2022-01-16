pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

import "../logica/Persona.sol";

contract PersonasDAO {
    address public creador;

    mapping(address => Persona) public personas;

    constructor() public {
        creador = msg.sender; // creador del contrato
    }

    function consultar(address direccion) public view returns (Persona) {
        // TODO: buscar persona en arreglo, ajustar para ver si existe el key en el mapping
        return personas[direccion]; 
    }

    // TODO: buscar porque es uint256
    function guardar(address direccion, Persona persona) public {  // TODO: quitar return en clase de enterprise architect        
        // TODO: Validar, si falla poner excepción
        personas[direccion] = persona;
    }
}
