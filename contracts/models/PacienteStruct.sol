// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../logica/Usuario.sol";

struct PacienteStruct {
    string estado; // debe ser un id
    // EstadoStruct estado;
    string datosPersonales;
    // DatosPersonales datosPersonales;
    // historiaClinicaId  // TODO: sobra ya que hay un mapping que asocia una dirección con una historia clinica
    bool isValue;
}