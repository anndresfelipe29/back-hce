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
    uint256 private rolId;
    bool private isValue;

    function getPrimerNombre() public view returns (string memory) {
        return primerNombre;
    }

    function getSegundoNombre() public view returns (string memory) {
        return segundoNombre;
    }

    function getIdentificacion() public view returns (string memory) {
        return identificacion;
    }

    function getTipoIdentificacionId() public view returns (uint256) {
        return tipoIdentificacionId;
    }

    function getRolId() public view returns (uint256) {
        return rolId;
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

    function setIdentificacion(string memory _identificacion) public {
        identificacion = _identificacion;
    }

    function setTipoIdentificacionId(uint256 _tipoIdentificacionId) public {
        tipoIdentificacionId = _tipoIdentificacionId;
    }

    function setRolId(uint256 _rolId) public {
        rolId = _rolId;
    }
}
