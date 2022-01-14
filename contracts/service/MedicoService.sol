pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

contract MedicoService {
    address public creador;

    constructor() public {
        creador = msg.sender; // creador del contrato
    }

    function verificarExistenciaEnSistemaExterno() public returns (bool) {
        address direccion = msg.sender;
        // TODO: buscar persona en arreglo
    }

    // TODO: buscar porque es uint256
    function buscarPerfilMedicoSistemaExterno(uint256 funcionId)
        public
        view
        returns (PerfilMedicoSistemaExternoStruct)
    {
        address direccion = msg.sender;
        // TODO: esto es como un filtro (averiguar si lo hay en solidity) y sirve para ver si un usario tiene acceso a x metodo
    }

    // TODO: buscar porque es uint256
    function registrar() public returns (bool) {
        address direccion = msg.sender;
        // TODO:
    }

    function consultar() public view returns (Medico) {
        address direccion = msg.sender;
        // TODO:
    }
}
