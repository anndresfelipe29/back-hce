pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

import "../logica/Persona.sol";

contract PersonaDAO {
    // Evento: envia una respuesta a un usuario, como un mensaje al parecer
    // event Log(address indexed user,  string data);
    event Log(string data);

    address public creador;

    mapping(address => Persona) public personas;

    constructor() public {
        creador = msg.sender; // creador del contrato
    }

    function existe(address direccion) public returns (bool existe)
    {
        return personas[direccion].getIsValue(); // no sirve
    }

    function consultar(address direccion) public returns (Persona) {
        // TODO: buscar persona en arreglo, ajustar para ver si existe el key en el mapping
        emit Log("entro a consultar");
        // bytes4(0x0) o !=0
        
        if (existe(direccion)) {
            emit Log("usuario valido");
            Persona persona = personas[direccion];
            return persona;
        } else {
            emit Log("no existe el usuario");
            revert("No existe ese paciente");
        }
    }

    // TODO: buscar porque es uint256
    function guardar(address direccion, Persona persona) public {
        // TODO: quitar return en clase de enterprise architect
        // TODO: Validar, si falla poner excepción
        // personas[direccion] = persona;
    }
}
