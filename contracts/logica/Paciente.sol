// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//import "./Persona.sol";
import "../models/PacienteVO.sol";
import "../persistence/PacienteMapper.sol";
import "./Acceso.sol";

contract Paciente {
    event Log(string data);
    address public creador;
    //address public pacienteMapperAddress;
    address public accesoAddress;

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
        returns (PacienteVO)
    {
        emit Log("Entro a consultar Paciente");
        return pacienteMapper.consultar(direccion);
        
    }

    // TODO Agregar a diagrama
    // Solo lo puede usar el paciente
    function miInformacion(address direccion)
        public
        tieneAcceso(2) 
        returns (PacienteVO)
    {
        if (direccion != msg.sender) {
            revert("Un paciente solo puede ver su propia informacion");
        }
        emit Log("Entro a consultar miInformacion paciente");
        return pacienteMapper.consultar(direccion);
        
    }
    
    // TODO: validar que pasa si falla el registro de persona
    // TODO: que pasa si falla guardar paciente?
    function registrar(address direccion, PacienteVO paciente)
        public
        tieneAcceso(2)
    {
        if (direccion != msg.sender) {
            revert("Un paciente se debe registrar a si mismo");
        }

        RolVO rol = rolMapper.consultar(rolPacienteId);
        UsuarioVO nuevoUsuario = new UsuarioVO(); 
        nuevoUsuario.setDireccion(direccion);
        nuevoUsuario.setRol(rol);
        nuevoUsuario.setEstaActivo(true);
        pacienteMapper.guardar(direccion, paciente);
        //usuarioMapper.guardar();
        // registrar usuario
        /* try  {
            emit Log("Se guarda la informacion de paciente correctamente");
        } catch Error(string memory data) {
            revert("No existe ese medico");
        }*/
    }

    function actualizar(address direccion, PacienteVO paciente)
        public
        tieneAcceso(2)
    {
        if (direccion != msg.sender) {
            // si alguien diferente al propietario de la historia la consulta se debe validar quien es
            // validar quien consulta
            revert("No tiene permisos de actualizar");
        }
        pacienteMapper.actualizar(direccion, paciente);
        /*
        try contratoPacienteDAO.actualizar(direccion, paciente) {
            emit Log("Se guarda la informacion de paciente correctamente");
        } catch Error(string memory data) {
            /*reason*/
        /*  emit Log("se rompio por un revert o require");
            emit Log(data);
        }*/
    }

    // TODO: poner modificador para que solo lo pueda ejecutar el service y
    // en el service que solo lo ejecute un médico
    function cambiarEstado(address _direccion, EstadoVO _estado)
        public
        tieneAcceso(3)
    {
        if (_direccion != msg.sender) {
            // si alguien diferente al propietario de la historia la consulta se debe validar quien es
            // validar quien consulta
            revert("No tiene permisos de actualizar");
        }
        PacienteVO paciente = consultar(_direccion);
        paciente.setEstado(_estado);
        actualizar(_direccion, paciente);
    }

    function setPacienteMapper(PacienteMapperInterface _pacienteMapperAddress)
        public
        esPropietario
    {
        // pacienteMapperAddress = _pacienteMapperAddress;
        // pacienteMapper = PacienteMapper(_pacienteMapperAddress);
        pacienteMapper = _pacienteMapperAddress;
    }

    function setRolMapper(RolMapperInterface _rolMapperAddress)
        public
        esPropietario
    {
        // pacienteMapperAddress = _pacienteMapperAddress;
        // pacienteMapper = PacienteMapper(_pacienteMapperAddress);
        rolMapper = _rolMapperAddress;
    }

    function setUsuarioMapper(UsuarioMapperInterface _usuarioMapperAddress)
        public
        esPropietario
    {
        // pacienteMapperAddress = _pacienteMapperAddress;
        // pacienteMapper = PacienteMapper(_pacienteMapperAddress);
        usuarioMapper = _usuarioMapperAddress;
    }

    function setAcceso(Acceso _accesoAddress) public esPropietario {
        //accesoAddress = _accesoAddress;
        //acceso = Acceso(_accesoAddress);
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
