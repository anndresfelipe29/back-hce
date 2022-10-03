// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// TODO: Agregar en enterprose architect
enum TipoRegistroMedico { 
    AlergiaVO, // 0
    AntecedenteLaboralVO,  // 1
    AntecedentePatologicoFamiliarVO, // 2
    AntecedentePatologicoPersonalVO, // 3
    AtencionUrgenciasVO, // 4
    ConsultaIndividualVO, // 5
    HabitosPersonalesVO, // 6
    HistoriaClinicaVO, // 7
    HospitalizacionVO, // 8
    InmunizacionVO, // 9
    IntoleraciaAMedicamentoVO, // 10
    PartoVO, // 11
    PerdidaDeConocimientoVO, // 12
    ProcedimientoQuirurgicoVO, // 13
    PruebaDeLaboratorioVO, // 14
    TransfusionVO, // 15
    TraumatismoVO // 16
    }
// https://solidity-es.readthedocs.io/es/latest/types.html#enums:~:text=Los-,Enums,-son%20una%20manera