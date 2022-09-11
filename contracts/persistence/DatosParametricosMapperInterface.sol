// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/RolVO.sol";
import "../models/VOGenerales/TipoIdentificacionVO.sol";
import "../models/VOGenerales/EstadoVO.sol";
import "../models/VOGenerales/EstadoCivilVO.sol";
import "../models/VOGenerales/AseguradoraVO.sol";
import "../models/VOGenerales/TipoVinculacionVO.sol";
import "../models/VOGenerales/EstadoHCEVO.sol";

interface DatosParametricosMapperInterface {
    event Log(string data);

    // function consultar(uint256 _id) external returns (RolVO);

    // function guardar(uint256 _id, RolVO paciente) external;

    //    function actualizar(uint256 _id, RolVO paciente) external;

    function consultarTipoIdentificacionVO(uint256 _id)
        external
        view
        returns (TipoIdentificacionVO);

    function guardarTipoIdentificacionVO(
        TipoIdentificacionVO _tipoIdentificacion
    ) external returns (uint256);

    function actualizarTipoIdentificacionVO(
        uint256 _id,
        TipoIdentificacionVO _tipoIdentificacion
    ) external;

    function consultarEstadoVO(uint256 _id) external view returns (EstadoVO);

    function guardarEstadoVO(EstadoVO _estado) external returns (uint256);

    function actualizarEstadoVO(uint256 _id, EstadoVO estado) external;

    function consultarEstadoCivilVO(uint256 _id)
        external
        view
        returns (EstadoCivilVO);

    function guardarEstadoCivilVO(EstadoCivilVO _estadoCivil)
        external
        returns (uint256);

    function actualizarEstadoCivilVO(uint256 _id, EstadoCivilVO _estadoCivil)
        external;

    function consultarAseguradoraVO(uint256 _id)
        external
        view
        returns (AseguradoraVO);

    function guardarAseguradoraVO(AseguradoraVO _aseguradora)
        external
        returns (uint256);

    function actualizarAseguradoraVO(uint256 _id, AseguradoraVO _aseguradoraVO)
        external;

    function consultarTipoVinculacionVO(uint256 _id)
        external
        view
        returns (TipoVinculacionVO);

    function guardarTipoVinculacionVO(TipoVinculacionVO _tipoVinculacion)
        external
        returns (uint256);

    function actualizarTipoVinculacionVO(
        uint256 _id,
        TipoVinculacionVO _tipoVinculacion
    ) external;

    function consultarEstadoHCEVO(uint256 _id)
        external
        view
        returns (EstadoHCEVO);

    function guardarEstadoHCEVO(EstadoHCEVO _estadoHCE)
        external
        returns (uint256);

    function actualizarEstadoHCEVO(uint256 _id, EstadoHCEVO _estadoHCE)
        external;

    function selfDestruct() external;
}
