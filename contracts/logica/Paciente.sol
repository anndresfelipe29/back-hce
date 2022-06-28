// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//import "./Persona.sol";
import "../models/PacienteVO.sol";
import "../persistence/PacienteMapper.sol";
import "./Acceso.sol";

contract Paciente {
    event Log(string data);
    address public creador;

    PacienteMapperInterface private pacienteMapper;
    RolMapperInterface private rolMapper;
    UsuarioMapperInterface private usuarioMapper;
    Acceso private acceso;
    

    //TODO Convertir eventualmente en un enum
    uint256 rolPacienteId = 1;

    constructor() {
        creador = msg.sender; // creador del contrato
    }

    // Puede el medico
    function consultar(address direccion)
        public
        tieneAcceso(1) 
        returns (PacienteVO.PacienteVOStruct memory)
    {
        emit Log("Entro a consultar Paciente");
        return pacienteMapper.consultar(direccion).getPacienteVOValue();
        
    }

    // TODO Agregar a diagrama
    // Solo lo puede usar el paciente
    function consultar()
        public
        tieneAcceso(2) 
        returns (PacienteVO)
    {
        emit Log("Entro a consultar miInformacion paciente");
        return pacienteMapper.consultar(msg.sender);
        
    }
    
    // TODO: validar que pasa si falla el registro de persona
    // TODO: que pasa si falla guardar paciente?
    //tieneAcceso(2)
    function registrar(address direccion, PacienteVO paciente)
        public
    {
        if (direccion != msg.sender) {
            revert("Un paciente se debe registrar a si mismo");
        }

        RolVO rol = rolMapper.consultar(rolPacienteId);
        UsuarioVO nuevoUsuario = new UsuarioVO(); 
        nuevoUsuario.setDireccion(direccion);
        nuevoUsuario.setRol(rol);
        nuevoUsuario.setEstaActivo(true);
        usuarioMapper.guardar(direccion, nuevoUsuario);
        pacienteMapper.guardar(direccion, paciente);
        // TODO Crear HC
        // registrar usuario
        
    }
    /*
    // TODO: Discutir si un médico debe actualizar al paciente (nombre y demas)
    // TODO: Sollo se podria acceder con el acceso que da el paciente sobre su info
    function actualizar(address direccion, PacienteVO paciente)
        public
        tieneAcceso(3)
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

    function actualizar(PacienteVO paciente)
        public
        tieneAcceso(3)
    {
        // bloquear actualización de estado
        pacienteMapper.actualizar(msg.sender, paciente);
    }

    // TODO: poner modificador para que solo lo pueda ejecutar el service y
    // en el service que solo lo ejecute un médico
    // TODO: Debe usar el permiso que da el paciente
    function cambiarEstado(address _direccion, EstadoVO _estado)
        public
        tieneAcceso(4)
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

    function setAcceso(Acceso _accesoAddress) public esPropietario {
        acceso = _accesoAddress;
    }

    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }

    modifier tieneAcceso(uint256 permisoId) {
        bool esAccesible = acceso.validarPermisoDeRol(msg.sender, permisoId);
        require(esAccesible, "El usuario no tiene acceso");
        _; // acá se ejecuta la función
    }
}
