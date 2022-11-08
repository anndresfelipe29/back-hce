// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// TODO: Agregar en enterprose architect
enum TipoRegistroMedico { 
    ALERGIAVO, // 0
    ANTECEDENTELABORALVO,  // 1
    ANTECEDENTEPATOLOGICOFAMILIARVO, // 2
    ANTECEDENTEPATOLOGICOPERSONALVO, // 3
    ATENCIONURGENCIASVO, // 4
    CONSULTAINDIVIDUALVO, // 5
    HABITOSPERSONALESVO, // 6
    HISTORIACLINICAVO, // 7
    HOSPITALIZACIONVO, // 8
    INMUNIZACIONVO, // 9
    INTOLERACIAAMEDICAMENTOVO, // 10
    PARTOVO, // 11
    PERDIDADECONOCIMIENTOVO, // 12
    PROCEDIMIENTOQUIRURGICOVO, // 13
    PRUEBADELABORATORIOVO, // 14
    TRANSFUSIONVO, // 15
    TRAUMATISMOVO // 16
    }
// https://solidity-es.readthedocs.io/es/latest/types.html#enums:~:text=Los-,Enums,-son%20una%20manera