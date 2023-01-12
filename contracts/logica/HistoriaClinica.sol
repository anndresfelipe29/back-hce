// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/historiaClinica/HistoriaClinicaVO.sol";
import "../persistence/HistoriaClinicaMapper.sol";
import "../persistence/DatosParametricosMapper.sol";
import "./IteradorHCE/FiltroTipoRegistroMedicoIterator.sol";
import "../utils/Modifiers.sol";

// import "../persistence/HistoriaClinicaMapper.sol";

contract HistoriaClinica is Modifiers {
    HistoriaClinicaMapperInterface private historiaClinicaMapper;
    DatosParametricosMapperInterface private datosParametricosMapper;

    constructor() {
        creador = msg.sender;
    }

    // TODO: Actualizar en enterprise
    // TODO: Agregar validador de permiso por tiempo
    function getHistoriaClinica(address direccion)
        public
        tieneAcceso(12)        
        returns (HistoriaClinicaVO.HistoriaClinicaStruct memory)
    {
        return
            historiaClinicaMapper
                .consultar(direccion)
                .getHistoriaClinicaStruct();
    }

    function inicializarHCE(address direccionPaciente) public tieneAcceso(13) esMedicoActivoModifier() {
        HistoriaClinicaVO nuevaHistoriaClinica = new HistoriaClinicaVO();
        // Llamar un estado del mapper de estados, y guardarlo
        EstadoHCEVO estadoHCE = datosParametricosMapper.consultarEstadoHCEVO(0);
        nuevaHistoriaClinica.setEstado(estadoHCE);
        historiaClinicaMapper.guardar(direccionPaciente, nuevaHistoriaClinica);
    }

    function agregarRegistro(
        address direccionPaciente,
        RegistroMedico registroMedico
    ) public tieneAcceso(14) tienePermisoDeAccesoTemporal(direccionPaciente) {
        registroMedico.setCodPrestadorServicioDeSalud(msg.sender);
        registroMedico.setFechaRegistro(block.timestamp);
        // TODO: Setear el tipo de registro médico desde el front
        // TODO: Falta definir el id
        HistoriaClinicaVO historiaClinica = historiaClinicaMapper.consultar(
            direccionPaciente
        );
        historiaClinica.agregarRegistroMedico(registroMedico);
    }

    // TODO: Agregar validador de permiso por tiempo
    function consultarRegistro(address direccionPaciente, uint256 idRegistro)
        public
        tieneAcceso(15) tienePermisoDeAccesoTemporal(direccionPaciente)
        returns (RegistroMedico)
    {
        HistoriaClinicaVO historiaClinica = historiaClinicaMapper.consultar(
            direccionPaciente
        );
        return historiaClinica.getListaRegistros()[idRegistro];
    }

    // TODO: Validar en enterprise architect
    function eliminarRegistro(address direccionPaciente, uint256 idRegistro)
        public
        tieneAcceso(16) tienePermisoDeAccesoTemporal(direccionPaciente)
    {
        HistoriaClinicaVO historiaClinica = historiaClinicaMapper.consultar(
            direccionPaciente
        );
        historiaClinica.eliminarRegistroMedico(idRegistro);
    }

    function registrosFiltradosPorFecha(
        address direccionPaciente,
        uint256 idRegistro
    ) public tieneAcceso(17) tienePermisoDeAccesoTemporal(direccionPaciente) returns (RegistroMedico[] memory) {
        HistoriaClinicaVO historiaClinica = historiaClinicaMapper.consultar(
            direccionPaciente
        );
        return historiaClinica.getListaRegistros();
    }

    // TODO: Agregar modifier para saber si puede consultar o no
    function registrosFiltradosPorTipo(
        address direccionPaciente,
        TipoRegistroMedico tipoRegistroMedico
    ) public tieneAcceso(18) tienePermisoDeAccesoTemporal(direccionPaciente) returns (RegistroMedico[] memory) {
        HistoriaClinicaVO historiaClinica = historiaClinicaMapper.consultar(
            direccionPaciente
        );
        RegistroMedico[] memory listaDeRegistros = historiaClinica
            .getListaRegistros();

        FiltroTipoRegistroMedicoIterator filtro = new FiltroTipoRegistroMedicoIterator(
                listaDeRegistros,
                tipoRegistroMedico
            );

        RegistroMedico[]
            memory listaDeRegistrosFiltrados = new RegistroMedico[](
                listaDeRegistros.length
            );

        bool hayMasRegistros = true;
        uint256 posicion = 0;
        while (hayMasRegistros) {
            try filtro.getNext() returns (RegistroMedico registro) {
                if (address(registro) == address(0)) {
                    hayMasRegistros = false;
                } else {
                    listaDeRegistrosFiltrados[posicion] = registro;
                    posicion = posicion + 1;
                }
            } catch Error(string memory e) {
                hayMasRegistros = false;
            }
        }
        filtro.selfDestruct();
        return listaDeRegistrosFiltrados;
    }

    function setHistoriaClinicaMapper(
        HistoriaClinicaMapperInterface _historiaClinicaMapper
    ) public esPropietario {
        historiaClinicaMapper = _historiaClinicaMapper;
    }

    function setDatosParametricosMapper(
        DatosParametricosMapperInterface _datosParametricosMapperAddress
    ) public esPropietario {
        datosParametricosMapper = _datosParametricosMapperAddress;
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }
}
