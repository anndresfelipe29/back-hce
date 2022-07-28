// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./Persona.sol";
import "./VOGenerales/EstadoVO.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
// TODO: verificar si se puede dejar como abstract
contract PerfilMedicoSistemaExternoVO {
    //
    string private codPrestadorServicios; // TODO: agregar al diccionario de datos
    string private primerNombre;
    string private segundoNombre;
    string private primerApellido;
    string private segundoApellido;
    string private tipoIdentificacion;
    string private identificacion;
    bool private estaActivo;

    struct PerfilMedicoSistemaExternoStruct {
        string primerNombre;
        string segundoNombre;
        string primerApellido;
        string segundoApellido;
        string identificacion; // TODO: agregar tipo de identificacion
        string especialidad;
    }

    function getCodPrestadorServicios() public view returns (string memory) {
        return codPrestadorServicios;
    }

    function getPrimerNombre() public view returns (string memory) {
        return primerNombre;
    }

    function getSegundoNombre() public view returns (string memory) {
        return segundoNombre;
    }

    function getPrimerApellido() public view returns (string memory) {
        return primerApellido;
    }

    function getSegundoApellido() public view returns (string memory) {
        return segundoApellido;
    }

    function getIdentificacion() public view returns (string memory) {
        return identificacion;
    }

    function getTipoIdentificacion() public view returns (string memory) {
        return tipoIdentificacion;
    }

    function getEstaActivo() public view returns (bool) {
        return estaActivo;
    }

    function setCodPrestadorServicios(string memory _codPrestadorServicios)
        public
    {
        codPrestadorServicios = _codPrestadorServicios;
    }

    function setPrimerNombre(string memory _primerNombre) public {
        primerNombre = _primerNombre;
    }

    function setSegundoNombre(string memory _segundoNombre) public {
        segundoNombre = _segundoNombre;
    }

    function setPrimerApellido(string memory _primerApellido) public {
        primerApellido = _primerApellido;
    }

    function setSegundoApellido(string memory _segundoApellido) public {
        segundoApellido = _segundoApellido;
    }

    function setIdentificacion(string memory _identificacion) public {
        identificacion = _identificacion;
    }

    function setTipoIdentificacionId(string memory _tipoIdentificacion) public {
        tipoIdentificacion = _tipoIdentificacion;
    }

    function setEstaActivo(bool _estaActivo) public {
        estaActivo = _estaActivo;
    }
}
