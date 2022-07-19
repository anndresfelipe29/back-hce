// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/structsGenerales/TipoIdentificacionStruct.sol";
import "../models/VOGenerales/EstadoVO.sol";
import "../models/VOGenerales/EstadoCivilVO.sol";
import "../models/VOGenerales/AseguradoraVO.sol";
import "../models/VOGenerales/TipoVinculacionVO.sol";
import "../models/VOGenerales/EstadoHCEVO.sol";
import "./DatosParametricosMapperInterface.sol";

contract DatosParametricosMapper is DatosParametricosMapperInterface {
    address public creador;

// Convertir TipoIdentificacionStruct a VO
    mapping(uint256 => TipoIdentificacionStruct) private tipoIdentificacion;
    address[] private tipoIdentificacionAddressList; // NOTE Mapped Structs with Index
    mapping(uint256 => EstadoVO) private estados; // TODO: Agregar a diagrama de clases
    address[] private estadosAddressList; // NOTE Mapped Structs with Index
    mapping(uint256 => EstadoCivilVO) private estadoCivilVO;
    address[] private estadoCivilVOAddressList; // NOTE Mapped Structs with Index
    mapping(uint256 => AseguradoraVO) private aseguradoraVO;
    address[] private aseguradoraVOAddressList; // NOTE Mapped Structs with Index
    mapping(uint256 => TipoVinculacionVO) private tipoVinculacionVO;
    address[] private tipoVinculacionVOAddressList; // NOTE Mapped Structs with Index
    mapping(uint256 => EstadoHCEVO) private estadoHCEVO;
    address[] private estadoHCEVOAddressList; // NOTE Mapped Structs with Index

    constructor() {
        creador = msg.sender;
    }

    // TODO: TipoIdentificacionStruct

    function consultarTipoIdentificacionStruct(uint256 _id) external view returns (TipoIdentificacionStruct) {
        TipoIdentificacionStruct tipoIdentificacionVO = tipoIdentificacion[_id];
        if (address(tipoIdentificacion) == address(0)) {
            revert("No existe ese tipo de identificacion");
        }
        return tipoIdentificacionVO;
    }

    function guardarTipoIdentificacionStruct(TipoIdentificacionStruct _tipoIdentificacion) public {
        tipoIdentificacion[tipoIdentificacionAddressList.length] = _tipoIdentificacion;
    }

    function actualizarTipoIdentificacionStruct(uint256 _id, TipoIdentificacionStruct _tipoIdentificacion) public {
        if (address(tipoIdentificacion[_id]) == address(0)) {
            revert("No existe un rol registrado con ese address");
        }
        tipoIdentificacion[_id] = _tipoIdentificacion;
    }

    // TODO: EstadoVO

    function consultarEstadoVO(uint256 _id) external view returns (EstadoVO) {
        EstadoVO estadosVO = estados[_id];
        if (address(estadosVO) == address(0)) {
            revert("No existe ese usuario");
        }
        return estados;
    }

    function guardarEstadoVO(uint256 _id, EstadoVO _estados) public {
        if (address(estados[_id]) != address(0)) {
            emit Log("Ya existe un estados registrado con ese address");
            revert("Ya existe un estados registrado con ese address");
        }
        estados[_id] = _estados;
    }

    function actualizar(uint256 _id, EstadoVO estados) public {
        if (address(estados[_id]) == address(0)) {
            revert("No existe un estados registrado con ese address");
        }
        estados[_id] = estados;
    }

        // TODO: TipoIdentificacionStruct

    function consultar(uint256 _id) external view returns (RolVO) {
        RolVO rolVO = roles[_id];
        if (address(rolVO) == address(0)) {
            revert("No existe ese usuario");
        }
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

        // TODO: TipoIdentificacionStruct

    function consultar(uint256 _id) external view returns (RolVO) {
        RolVO rolVO = roles[_id];
        if (address(rolVO) == address(0)) {
            revert("No existe ese usuario");
        }
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

        // TODO: TipoIdentificacionStruct

    function consultar(uint256 _id) external view returns (RolVO) {
        RolVO rolVO = roles[_id];
        if (address(rolVO) == address(0)) {
            revert("No existe ese usuario");
        }
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

        // TODO: TipoIdentificacionStruct

    function consultar(uint256 _id) external view returns (RolVO) {
        RolVO rolVO = roles[_id];
        if (address(rolVO) == address(0)) {
            revert("No existe ese usuario");
        }
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
