// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/PersonaStruct.sol";
import "../persistence/PersonaDAO.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
// TODO: verificar si se puede dejar como abstract
abstract contract PersonaVO {
    event Log(string data);

    string public primerNombre;
    string public segundoNombre;
    string public primerApellido;
    string public segundoApellido;
    string public identificacion;
    uint256 public tipoIdentificacionId; //TODO: Esto debe ser un id
    uint256 public rolId;
    bool public isValue;

    function getPrimerNombre() public returns (string memory) {
        return primerNombre;
    }

    function getSegundoNombre() public returns (string memory) {
        return segundoNombre;
    }

    function getIdentificacion() public returns (string memory) {
        return identificacion;
    }

    function getTipoIdentificacionId() public returns (uint256 memory) {
        return tipoIdentificacionId;
    }

    function getRolId() public returns (uint256 memory) {
        return rolId;
    }

    function getIsValue() public returns (bool) {
        return isValue;
    }

    function setPrimerNombre(string memory data) public {
        primerNombre = data;
    }

    function setSegundoNombre(string memory data) public {
        segundoNombre = data;
    }

    function setIsValue(bool data) public returns (bool) {
        isValue = data;
    }
}
