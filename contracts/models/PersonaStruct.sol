// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../logica/Usuario.sol";

struct PersonaStruct {
    string primerNombre;
    string segundoNombre;
    string primerApellido;
    string segundoApellido;
    string identificacion;
    // TipoIdentificacionStruct public tipoIdentificacion; // TODO: cambiar tipo por el de la estructura más adelante
    string tipoIdentificacion;
    // Usuario accesoUsuario;
    bool isValue;
}
