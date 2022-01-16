pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

import '../logica/Medico.sol';

contract MedicoService {
    address public creador;

    constructor() public {
        creador = msg.sender; // creador del contrato
    }

    function verificarExistenciaEnSistemaExterno(address direccion) public returns (bool) {
        
        // TODO: acá va un oráculo
    }

    // TODO: buscar porque es uint256
    function buscarPerfilMedicoSistemaExterno(address direccion) public view returns (PerfilMedicoSistemaExternoStruct)    {
        // address direccion = msg.sender;
        // TODO: esto es como un filtro (averiguar si lo hay en solidity) y sirve para ver si un usario tiene acceso a x metodo
    }

    // TODO: buscar porque es uint256
    function registrar(address direccion) public returns (bool) { // TODO: redefinir, acá le paga a persona dao y usa el método guardar
        // address direccion = msg.sender;
        // TODO:
    }

    function consultar(address direccion) public view returns (Medico) {
        
        // TODO: usar PersonaDAO y usar método consultar
    }
}
