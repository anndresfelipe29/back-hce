// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
abstract contract Persona {
    event Log(string data);

    string private primerNombre;
    string private segundoNombre;
    string private primerApellido;
    string private segundoApellido;
    string private identificacion;
    uint256 private tipoIdentificacionId;
    bool private isValue;

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

    function getTipoIdentificacionId() public view returns (uint256) {
        return tipoIdentificacionId;
    }

    function getIsValue() public view returns (bool) {
        return isValue;
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

    function setTipoIdentificacionId(uint256 _tipoIdentificacionId) public {
        tipoIdentificacionId = _tipoIdentificacionId;
    }

    function setIsValue(bool _isValue) public {
        isValue = _isValue;
    }
}
