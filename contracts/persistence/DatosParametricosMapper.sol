// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/VOGenerales/TipoIdentificacionVO.sol";
import "../models/VOGenerales/EstadoVO.sol";
import "../models/VOGenerales/EstadoCivilVO.sol";
import "../models/VOGenerales/AseguradoraVO.sol";
import "../models/VOGenerales/TipoVinculacionVO.sol";
import "../models/VOGenerales/EstadoHCEVO.sol";
import "./DatosParametricosMapperInterface.sol";

contract DatosParametricosMapper is DatosParametricosMapperInterface {
    address public creador;

    // Convertir TipoIdentificacionStruct a VO
    mapping(address => TipoIdentificacionVO) private tipoIdentificacion;
    address[] public tipoIdentificacionAddressList; // NOTE Mapped Structs with Index
    mapping(address => EstadoVO) private estados; // TODO: Agregar a diagrama de clases
    address[] private estadosAddressList; // NOTE Mapped Structs with Index
    mapping(address => EstadoCivilVO) private estadoCivilVO;
    address[] private estadoCivilVOAddressList; // NOTE Mapped Structs with Index
    mapping(address => AseguradoraVO) private aseguradoraVO;
    address[] private aseguradoraVOAddressList; // NOTE Mapped Structs with Index
    mapping(address => TipoVinculacionVO) private tipoVinculacionVO;
    address[] private tipoVinculacionVOAddressList; // NOTE Mapped Structs with Index
    mapping(address => EstadoHCEVO) private estadoHCEVO;
    address[] private estadoHCEVOAddressList; // NOTE Mapped Structs with Index

    constructor() {
        creador = msg.sender;
    }

    // TODO: TipoIdentificacionStruct

    function registros() external view returns(uint256){
        return tipoIdentificacionAddressList.length;
    }

    function consultarTipoIdentificacionVO(uint256 _id)
        external
        view
        returns (TipoIdentificacionVO)
    {
        address direccion = tipoIdentificacionAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese tipo de identificacion");
        }
        TipoIdentificacionVO tipoIdentificacionVO = tipoIdentificacion[
            direccion
        ];
        return tipoIdentificacionVO;
    }

    function guardarTipoIdentificacionVO(
        TipoIdentificacionVO _tipoIdentificacion
    ) external returns (uint256) {
        address direccion = address(_tipoIdentificacion);
        if (address(tipoIdentificacion[direccion]) != address(0))
            revert(
                "Ya existe un tipo de identificacion registrado con ese address"
            );
        uint256 id = tipoIdentificacionAddressList.length;
        _tipoIdentificacion.setId(id);
        tipoIdentificacionAddressList.push(direccion);
        tipoIdentificacion[direccion] = _tipoIdentificacion;
        return id;
    }

    function actualizarTipoIdentificacionVO(
        uint256 _id,
        TipoIdentificacionVO _tipoIdentificacion
    ) external {
        address direccion = tipoIdentificacionAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese tipo de identificacion");
        }
        tipoIdentificacion[direccion] = _tipoIdentificacion;
    }

    // TODO: EstadoVO
    function consultarEstadoVO(uint256 _id) external view returns (EstadoVO) {
        address direccion = estadosAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese estado");
        }
        EstadoVO estadoVO = estados[direccion];
        return estadoVO;
    }

    function guardarEstadoVO(EstadoVO _estado) external returns (uint256) {
        address direccion = address(_estado);
        if (address(estados[direccion]) != address(0))
            revert("Ya existe un estado registrado con ese address");
        uint256 id = estadosAddressList.length;
        _estado.setId(id);        
        estadosAddressList.push(direccion);
        estados[direccion] = _estado;
        return id;
    }

    function actualizarEstadoVO(uint256 _id, EstadoVO estado) external {
        address direccion = estadosAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese estado");
        }
        estados[direccion] = estado;
    }

    // TODO: EstadoCivilVO
    function consultarEstadoCivilVO(uint256 _id)
        external
        view
        returns (EstadoCivilVO)
    {
        address direccion = estadoCivilVOAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese estado");
        }
        EstadoCivilVO estadoCivil = estadoCivilVO[direccion];
        return estadoCivil;
    }

    function guardarEstadoCivilVO(EstadoCivilVO _estadoCivil)
        external
        returns (uint256)
    {
        address direccion = address(_estadoCivil);
        if (address(estadoCivilVO[direccion]) != address(0))
            revert("Ya existe un estado registrado con ese address");
        uint256 id = estadoCivilVOAddressList.length;
        _estadoCivil.setId(id);
        estadoCivilVO[direccion] = _estadoCivil;
        estadoCivilVOAddressList.push(direccion);
        return id;
    }

    function actualizarEstadoCivilVO(uint256 _id, EstadoCivilVO _estadoCivil)
        external
    {
        address direccion = estadoCivilVOAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese estado");
        }
        estadoCivilVO[direccion] = _estadoCivil;
    }

    // TODO: AseguradoraVO
    function consultarAseguradoraVO(uint256 _id)
        external
        view
        returns (AseguradoraVO)
    {
        address direccion = aseguradoraVOAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese estado");
        }
        AseguradoraVO aseguradora = aseguradoraVO[direccion];
        return aseguradora;
    }

    function guardarAseguradoraVO(AseguradoraVO _aseguradora)
        external
        returns (uint256)
    {
        address direccion = address(_aseguradora);
        if (address(aseguradoraVO[direccion]) != address(0))
            revert("Ya existe un estado registrado con ese address");
        uint256 id = aseguradoraVOAddressList.length;
        _aseguradora.setId(id);
        aseguradoraVO[direccion] = _aseguradora;
        aseguradoraVOAddressList.push(direccion);
        return id;
    }

    function actualizarAseguradoraVO(uint256 _id, AseguradoraVO _aseguradoraVO)
        external
    {
        address direccion = aseguradoraVOAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese estado");
        }
        aseguradoraVO[direccion] = _aseguradoraVO;
    }

    // TODO: TipoVinculacionVO
    function consultarTipoVinculacionVO(uint256 _id)
        external
        view
        returns (TipoVinculacionVO)
    {
        address direccion = tipoVinculacionVOAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese estado");
        }
        TipoVinculacionVO tipoVinculacion = tipoVinculacionVO[direccion];
        return tipoVinculacion;
    }

    function guardarTipoVinculacionVO(TipoVinculacionVO _tipoVinculacion)
        external
        returns (uint256)
    {
        address direccion = address(_tipoVinculacion);
        if (address(tipoVinculacionVO[direccion]) != address(0))
            revert("Ya existe un estado registrado con ese address");
        uint256 id = tipoVinculacionVOAddressList.length;
        _tipoVinculacion.setId(id);
        tipoVinculacionVO[direccion] = _tipoVinculacion;
        tipoVinculacionVOAddressList.push(direccion);
        return id;
    }

    function actualizarTipoVinculacionVO(
        uint256 _id,
        TipoVinculacionVO _tipoVinculacion
    ) external {
        address direccion = tipoVinculacionVOAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese estado");
        }
        tipoVinculacionVO[direccion] = _tipoVinculacion;
    }

    // TODO: EstadoHCEVO
    /**
        Los posibles estados son:
         activo 0
         inactivo 1
         cerrado 2
     */
    function consultarEstadoHCEVO(uint256 _id)
        external
        view
        returns (EstadoHCEVO)
    {
        address direccion = estadoHCEVOAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese estado");
        }
        EstadoHCEVO estadoHCE = estadoHCEVO[direccion];
        return estadoHCE;
    }

    function guardarEstadoHCEVO(EstadoHCEVO _estadoHCE)
        external
        returns (uint256)
    {
        address direccion = address(_estadoHCE);
        if (address(estadoHCEVO[direccion]) != address(0))
            revert("Ya existe un estado registrado con ese address");
        uint256 id = estadoHCEVOAddressList.length ;
        _estadoHCE.setId(id);
        estadoHCEVO[direccion] = _estadoHCE;
        estadoHCEVOAddressList.push(direccion);
        return id;
    }

    function actualizarEstadoHCEVO(uint256 _id, EstadoHCEVO _estadoHCE)
        external
    {
        address direccion = estadoHCEVOAddressList[_id];
        if (direccion == address(0)) {
            revert("No existe ese estado");
        }
        estadoHCEVO[direccion] = _estadoHCE;
    }

    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    function selfDestruct() external esPropietario {
        selfdestruct(payable(creador));
    }
}
