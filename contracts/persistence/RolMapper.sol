// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
import "../models/RolVO.sol";
import "./RolMapperInterface.sol";

contract RolMapper is RolMapperInterface {
    address public creador;

    mapping(uint256 => RolVO) private roles;

    constructor() {
        creador = msg.sender;
    }

    function consultar(uint256 _id) external view returns (RolVO) {
        //emit Log("entro a consultar");
        RolVO rolVO = roles[_id];
        if (address(rolVO) == address(0)) {
            revert("No existe ese usuario");
        }
        // emit Log("usuario valido");
        //emit Log(usuario);
        return rolVO;
    }

    function guardar(uint256 _id, RolVO _rol) public {
        if (address(roles[_id]) != address(0)) {
            emit Log("Ya existe un rol registrado con ese address");
            revert("Ya existe un rol registrado con ese address");
        }
        roles[_id] = _rol;
    }

    function actualizar(uint256 _id, RolVO rol) public {
        if (address(roles[_id]) == address(0)) {
            revert("No existe un rol registrado con ese address");
        }
        roles[_id] = rol;
    }

    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }
}
