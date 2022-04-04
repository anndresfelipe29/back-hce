// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//import "./Persona.sol";
import "../models/PacienteVO.sol";
import "../persistence/PacienteMapper.sol";
import "./Acceso.sol";

contract Paciente {
    event Log(string data);
    address public creador;
    address public pacienteMapperAddress;
    address public accesoAddress;

    PacienteMapper private pacienteMapper;
    Acceso private acceso;

    constructor() {
        creador = msg.sender; // creador del contrato
    }

    function consultar(address direccion)
        public
        tieneAcceso(0)
        returns (PacienteVO)
    {
        /*if (direccion != msg.sender) {
            // si alguien diferente al propietario de la historia la consulta se debe validar quien es
            // validar quien consulta
            revert("No tiene permisos de consulta");
        }*/
        emit Log("entro a consultar Paciente");
        return pacienteMapper.consultar(direccion);
        /* try  returns (PacienteVO response){
            emit Log("encontro la Paciente");
            return response;
        } catch Error(string memory e) {
            /*reason*/
        /*emit Log("se rompio por un revert o require");
            emit Log(e);
            revert("No existe ese Paciente");
        } */
    }

    // TODO: validar que pasa si falla el registro de persona
    // TODO: que pasa si falla guardar paciente?
    function registrar(address direccion, PacienteVO paciente)
        public
        tieneAcceso(1)
    {
        if (direccion != msg.sender) {
            revert("Un paciente se debe registrar a si mismo");
        }
        pacienteMapper.guardar(direccion, paciente);
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

    function setPacienteMapper(address _pacienteMapperAddress)
        public
        esPropietario
    {
        pacienteMapperAddress = _pacienteMapperAddress;
        pacienteMapper = PacienteMapper(_pacienteMapperAddress);
    }

    function setAcceso(address _accesoAddress) public esPropietario {
        accesoAddress = _accesoAddress;
        acceso = Acceso(_accesoAddress);
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
        bool esAccesible = acceso.buscarPermisoDeRol(msg.sender, permisoId);
        require(esAccesible, "El usuario no tiene acceso");
        _; // acá se ejecuta la función
    }
}
