// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract PermisoDeAccesoVO {
    address public creador;

    struct PermisoDeAccesoStruct {
        uint256 id;
        string llave;
        address paciente;
        address solicitante;
        bool fueRespondido;
        uint256 fechaSolicitud;
        uint256 fechaExpiracion;
    }

    // TODO: Actualizar en diagrama
    uint256 private id;
    string private llave;
    address private paciente;
    address private solicitante;
    bool private fueRespondido;
    uint256 private fechaSolicitud;
    uint256 private fechaExpiracion;

    constructor() {
        creador = msg.sender;
    }

    function getPermisoDeAccesoStruct()
        public
        view
        returns (PermisoDeAccesoStruct memory)
    {
        return
            PermisoDeAccesoStruct(
                id,
                llave,
                paciente,
                solicitante,
                fueRespondido,
                fechaSolicitud,
                fechaExpiracion
            );
    }

    function setPermisoDeAccesoStruct(
        PermisoDeAccesoStruct memory _permisoDeAccesoStruct
    ) public {
        id = _permisoDeAccesoStruct.id;
        llave = _permisoDeAccesoStruct.llave;
        fueRespondido = _permisoDeAccesoStruct.fueRespondido;
        fechaSolicitud = _permisoDeAccesoStruct.fechaSolicitud;
        fechaExpiracion = _permisoDeAccesoStruct.fechaExpiracion;
    }

    function getId() public view returns (uint256) {
        return id;
    }

    function getLlave() public view returns (string memory) {
        return llave;
    }

    function getPaciente() public view returns (address) {
        return paciente;
    }

    function getSolicitante() public view returns (address) {
        return solicitante;
    }

    function getFueRespondido() public view returns (bool) {
        return fueRespondido;
    }

    function getFechaSolicitud() public view returns (uint256) {
        return fechaSolicitud;
    }

    function getFechaExpiracion() public view returns (uint256) {
        return fechaExpiracion;
    }

    function setId(uint256 _id) public {
        id = _id;
    }

    function setLlave(string memory _llave) public {
        llave = _llave;
    }

    function setPaciente(address _paciente) public {
        paciente = _paciente;
    }

    function setSolicitante(address _solicitante) public {
        solicitante = _solicitante;
    }

    function setFueRespondido(bool _fueRespondido) public {
        fueRespondido = _fueRespondido;
    }

    function setFechaSolicitud(uint256 _fechaSolicitud) public {
        fechaSolicitud = _fechaSolicitud;
    }

    function setFechaExpiracion(uint256 _fechaExpiracion) public {
        fechaExpiracion = _fechaExpiracion;
    }
}
