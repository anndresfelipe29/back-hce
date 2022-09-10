// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// import "../logica/Persona.sol";
import "../models/RolVO.sol";
import "./RolMapperInterface.sol";

contract RolMapper is RolMapperInterface {
    address public creador;

    mapping(address => RolVO) private roles;
    address[] private rolAddressList; // NOTE Mapped Structs with Index

    constructor() {
        creador = msg.sender;
    }

    function consultar(uint256 _id) external view returns (RolVO) {
        address direccion = rolAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese rol");
        }
        RolVO rolVO = roles[direccion];
        return rolVO;
    }

    function guardar(RolVO _rol) external returns (uint256){
        address direccion = address(_rol);
        if (address(roles[direccion]) != address(0)) {
            emit Log("Ya existe un rol registrado con ese address");
            revert("Ya existe un rol registrado con ese address");
        }
        uint256 id = rolAddressList.length;
        _rol.setId(id);
        rolAddressList.push(direccion);
        roles[direccion] = _rol;
        return id;
    }

    function actualizar(uint256 _id, RolVO rol) external {
        address direccion = rolAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe un rol registrado con ese address");
        }
        roles[direccion] = rol;
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
