pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

contract PacienteService {
    address public creador;

    constructor() public {
        creador = msg.sender; // creador del contrato
    }

    function activar() public returns(bool) {
        address direccion = msg.sender;
        // TODO: buscar persona en arreglo
    }

    // TODO: buscar porque es uint256
    function registrar() public returns(bool) {
        address direccion = msg.sender;
        // TODO: 
    }

    function consultar() public view returns(Paciente){
        address direccion = msg.sender;
        // TODO: 
    }
}