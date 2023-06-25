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
        bool fueAceptado;
        int256 fechaSolicitud;
        int256 fechaExpiracion;
    }

    // TODO: Actualizar en diagrama
    uint256 private id;
    string private llave;
    address private paciente;
    address private solicitante;
    bool private fueRespondido;
    bool private fueAceptado;
    int256 private fechaSolicitud;
    int256 private fechaExpiracion;

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
                fueAceptado,
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
        fueAceptado = _permisoDeAccesoStruct.fueAceptado;
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

    function getFueAceptado() public view returns (bool) {
        return fueAceptado;
    }

    function getFechaSolicitud() public view returns (int256) {
        return fechaSolicitud;
    }

    function getFechaExpiracion() public view returns (int256) {
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

    function setFueAceptado(bool _fueAceptado) public {
        fueAceptado = _fueAceptado;
    }

    function setFechaSolicitud(int256 _fechaSolicitud) public {
        fechaSolicitud = _fechaSolicitud;
    }

    function setFechaExpiracion(int256 _fechaExpiracion) public {
        fechaExpiracion = _fechaExpiracion;
    }
}
