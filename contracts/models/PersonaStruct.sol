// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../logica/Usuario.sol";
import "../models/structsGenerales/TipoIdentificacionStruct.sol";

struct PersonaStruct {
    string primerNombre;
    string segundoNombre;
    string primerApellido;
    string segundoApellido;
    string identificacion;
    TipoIdentificacionStruct tipoIdentificacionId;
    uint256 rolId;
    bool isValue;
}
