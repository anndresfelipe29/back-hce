// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract PermisoDeAccesoVO {
    address public creador;

    struct PermisoDeAccesoStruct {
        int256 id;
        string llave;
        bool estaActivo;
        uint256 fechaSolicitud;
        uint256 fechaExpiracion;
    }

    // TODO: Actualizar en diagrama
    int256 private id;
    string private llave;
    bool private estaActivo;
    uint256 private fechaSolicitud;
    uint256 private fechaExpiracion;

    constructor() {
        creador = msg.sender;
    }

    function getPermisoDeAccesoStruct() public view returns (PermisoDeAccesoStruct memory) {
        return PermisoDeAccesoStruct(
            id,
            llave,
            estaActivo,
            fechaSolicitud,
            fechaExpiracion
        );
    }

    function setPermisoDeAccesoStruct(PermisoDeAccesoStruct memory _permisoDeAccesoStruct) public {
        id = _permisoDeAccesoStruct.id;
        llave = _permisoDeAccesoStruct.llave;
        estaActivo = _permisoDeAccesoStruct.estaActivo;
        fechaSolicitud = _permisoDeAccesoStruct.fechaSolicitud;
        fechaExpiracion = _permisoDeAccesoStruct.fechaExpiracion;
    }

    function getId() public view returns (int256) {
        return id;
    }

    function getEstaActivo() public view returns (bool) {
        return estaActivo;
    }

    function getFechaSolicitud() public view returns (uint256) {
        return fechaSolicitud;
    }

    function getFechaExpiracion() public view returns (uint256) {
        return fechaExpiracion;
    }

    function setId(int256 _id) public {
        id = _id;
    }

    function setEstaActivo(bool _estaActivo) public {
        estaActivo = _estaActivo;
    }

    function setFechaSolicitud(uint256 _fechaSolicitud) public {
        fechaSolicitud = _fechaSolicitud;
    }

    function setFechaExpiracion(uint256 _fechaExpiracion) public {
        fechaExpiracion = _fechaExpiracion;
    }
}
