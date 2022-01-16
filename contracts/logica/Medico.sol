pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

import "./Persona.sol";

contract Medico is Persona {
    address public creador;

    struct PerfilMedicoSistemaExternoStruct {
        string primerNombre;
        string segundoNombre;
        string primerApellido;
        string segundoApellido;
        string identificacion;  // TODO: agregar tipo de identificacion
        string especialidad;
    }

    constructor() public {
        creador = msg.sender; // creador del contrato
    }

    function login() public returns (Persona) {
        address direccion = msg.sender;
        // TODO: buscar persona en arreglo
    }

    // TODO: buscar porque es uint256
    function buscarPermisosDeRol(uint256 funcionId) public view returns (bool) {
        address direccion = msg.sender;
        // TODO: esto es como un filtro (averiguar si lo hay en solidity) y sirve para ver si un usario tiene acceso a x metodo
    }
}
