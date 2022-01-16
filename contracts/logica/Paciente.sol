pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

import "./Persona.sol";

contract Paciente is Persona {
    address public creador;

    constructor() public {
        creador = msg.sender; // creador del contrato
    }

}
