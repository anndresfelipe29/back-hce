// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//import "./Persona.sol";
import "../models/PacienteVO.sol";
import "../persistence/PacienteMapper.sol";
import "./Acceso.sol";
import "../persistence/DatosParametricosMapper.sol";
import "../persistence/DatosParametricosMapperInterface.sol";
import "../models/VOGenerales/enums/RolDeAccesoEnum.sol";
import "../utils/Modifiers.sol";

// TODO
contract Paciente is Modifiers {
    //address public creador;

    PacienteMapperInterface private pacienteMapper;
    RolMapperInterface private rolMapper;
    UsuarioMapperInterface private usuarioMapper;
    DatosParametricosMapperInterface private datosParametricosMapper;
    // Acceso private acceso;

    constructor() {
        creador = msg.sender; // creador del contrato
    }

    // Solo lo puede usar el medico
    function consultar(address direccion)
        public
        tieneAcceso(1)
        returns (PacienteVO.PacienteVOStruct memory)
    {
        return pacienteMapper.consultar(direccion).getPacienteVOValue();
    }

    // TODO Agregar a diagrama
    // Solo lo puede usar el paciente
    function consultar()
        public
        tieneAcceso(2)
        returns (PacienteVO.PacienteVOStruct memory)
    {
        return pacienteMapper.consultar(msg.sender).getPacienteVOValue();
    }

    // Solo lo puede usar el medico
    function consultarPorId(uint256 id)
        public
        tieneAcceso(3)
        returns (PacienteVO.PacienteVOStruct memory)
    {
        return pacienteMapper.consultarPorId(id).getPacienteVOValue();
    }

    // TODO: validar que pasa si falla el registro de persona
    // TODO: que pasa si falla guardar paciente?
    // Solo lo puede usar el paciente (si aún no esta registrado)
    function registrar(address direccion, PacienteVO paciente)
        public
        tieneAcceso(4)
    {
        if (direccion != msg.sender) {
            revert("Un paciente se debe registrar a si mismo");
        }

        RolVO rol = rolMapper.consultar(RolDeAccesoEnum.PACIENTE);
        UsuarioVO nuevoUsuario = new UsuarioVO();
        nuevoUsuario.setDireccion(direccion);
        nuevoUsuario.setRol(rol);
        nuevoUsuario.setEstaActivo(true);
        usuarioMapper.guardar(direccion, nuevoUsuario);
        pacienteMapper.guardar(direccion, paciente);
        // TODO Crear HC
    }

    // TODO: validar que pasa si falla el registro de persona
    // TODO: que pasa si falla guardar paciente?
    function registrarConStruct(
        address direccion,
        PacienteVO.PacienteVOStruct memory pacienteVOStruct
    ) public {
        PacienteVO pacienteVO = new PacienteVO();
        EstadoVO estadoVO = datosParametricosMapper.consultarEstadoVO(
            1
        );
        TipoIdentificacionVO _tipoIdentificacionVO = datosParametricosMapper
            .consultarTipoIdentificacionVO(
                pacienteVOStruct.persona.tipoIdentificacion
            );

        pacienteVO.setValuesOfPacienteVOStruct(
            pacienteVOStruct,
            estadoVO,
            _tipoIdentificacionVO
        );
        registrar(direccion, pacienteVO);
    }

    /*
    // TODO: Discutir si un médico debe actualizar al paciente (nombre y demas)
    // TODO: Solo se podria acceder con el acceso que da el paciente sobre su info
    function actualizar(address direccion, PacienteVO paciente)
        public
        tieneAcceso(6)
    {
        if (direccion != msg.sender) {
            // si alguien diferente al propietario de la historia la consulta se debe validar quien es
            // validar quien consulta
            revert("No tiene permisos de actualizar");
        }
        // bloquear actualización de estado
        pacienteMapper.actualizar(direccion, paciente);
    }
    */

    // TODO: Terminar esté método
    function actualizar(PacienteVO paciente) public tieneAcceso(3) {
        // bloquear actualización de estado
        pacienteMapper.actualizar(msg.sender, paciente);
    }

    // Solo lo puede usar el medico
    function cambiarEstado(address _direccion, EstadoVO _estado)
        public
        tieneAcceso(5)
    {
        PacienteVO paciente = pacienteMapper.consultar(_direccion);
        paciente.setEstado(_estado);
        pacienteMapper.actualizar(_direccion, paciente);
    }

    function setPacienteMapper(PacienteMapperInterface _pacienteMapperAddress)
        public
        esPropietario
    {
        pacienteMapper = _pacienteMapperAddress;
    }

    function setRolMapper(RolMapperInterface _rolMapperAddress)
        public
        esPropietario
    {
        rolMapper = _rolMapperAddress;
    }

    function setUsuarioMapper(UsuarioMapperInterface _usuarioMapperAddress)
        public
        esPropietario
    {
        usuarioMapper = _usuarioMapperAddress;
    }

    function setDatosParametricosMapper(
        DatosParametricosMapperInterface _datosParametricosMapperAddress
    ) public esPropietario {
        datosParametricosMapper = _datosParametricosMapperAddress;
    }

    /*function setAcceso(Acceso _accesoAddress) public esPropietario {
        acceso = _accesoAddress;
    }*/

    /*
    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }
    */

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }

    // TODO: Quitar
    /* modifier tieneAcceso(uint256 permisoId) {
        bool esAccesible = acceso.validarPermisoDeRol(msg.sender, permisoId);
        require(esAccesible, "El usuario no tiene acceso");
        _; // acá se ejecuta la función
    } */
}
