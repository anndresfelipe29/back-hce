pragma solidity ^0.8.17;

import "../models/MedicoVO.sol";

contract AccesoHistoriaClinica {
    address public creador;

    // Lo hace el médico
    function solicitarAccesoHistoriaClinica(
        address direccionPaciente,
        address direccionMedico
    ) external returns (MedicoVO) {}

    // TODO: Actualizar en enterprise
    // Lo hace el paciente
    function responderSolicitudDeAcceso(uint256 idSolicitud, bool respuesta)
        external
        returns (uint256) {}
}
