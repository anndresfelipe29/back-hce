// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
import "../models/UsuarioVO.sol";
import "./UsuarioMapperInterface.sol";

contract UsuarioMapper is UsuarioMapperInterface {
    address public creador;

    mapping(address => UsuarioVO) private usuarios;

    constructor() {
        creador = msg.sender;
    }

    function consultar(address direccion) external view returns (UsuarioVO) {
        //emit Log("entro a consultar");
        UsuarioVO usuario = usuarios[direccion];
        if (address(usuario) == address(0)) {
            revert("No existe ese usuario");
        }
        // emit Log("usuario valido");
        //emit Log(usuario);
        return usuario;
    }

    function guardar(address direccion, UsuarioVO _usuario) public {
        if (address(usuarios[direccion]) != address(0)) {
            emit Log("Ya existe un usuario registrado con ese address");
            revert("Ya existe un usuario registrado con ese address");
        }
        usuarios[direccion] = _usuario;
    }

    function actualizar(address direccion, UsuarioVO usuario) public {
        if (address(usuarios[direccion]) == address(0)) {
            revert("No existe un usuario registrado con ese address");
        }
        usuarios[direccion] = usuario;
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
