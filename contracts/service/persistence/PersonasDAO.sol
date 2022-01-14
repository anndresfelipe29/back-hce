pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

contract PersonasDAO {
    address public creador;

    constructor() public {
        creador = msg.sender; // creador del contrato
    }

    function login() public returns(Persona){
        address direccion = msg.sender;
        // TODO: buscar persona en arreglo
    }

    // TODO: buscar porque es uint256
    function buscarPermisosDeRol(uint256 funcionId) public view returns(bool){
        address direccion = msg.sender;
        // TODO: esto es como un filtro (averiguar si lo hay en solidity) y sirve para ver si un usario tiene acceso a x metodo
    }
}