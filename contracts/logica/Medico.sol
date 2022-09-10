pragma solidity ^0.8.17;

import "../models/MedicoVO.sol";
import "../persistence/MedicoMapper.sol";
import "../persistence/DatosParametricosMapper.sol";

import "./sistemaExterno/MedicoOraculo.sol";
import "./Acceso.sol";

contract Medico {
    // TODO: consumir este evento desde una clase heredada o algo así
    event Log(string data);
    address public creador;
    address public medicoMapperAddress;

    MedicoMapperInterface private medicoMapper;
    DatosParametricosMapperInterface private datosParametricosMapper;
    MedicoOraculo private medicoOraculo;
    RolMapperInterface private rolMapper;
    UsuarioMapperInterface private usuarioMapper;

    //TODO Convertir eventualmente en un enum
    uint256 rolMedicoId = 1;

    constructor() {
        creador = msg.sender;
    }

    function consultar(address direccion)
        public
        returns (MedicoVO.MedicoVOStruct memory)
    {
        emit Log("entro a consultar");
        return medicoMapper.consultar(direccion).getMedicoVOValue();
    }

    function registrar(address direccion, MedicoVO medico) public {
        RolVO rol = rolMapper.consultar(rolMedicoId);
        UsuarioVO nuevoUsuario = new UsuarioVO();
        nuevoUsuario.setDireccion(direccion);
        nuevoUsuario.setRol(rol);
        nuevoUsuario.setEstaActivo(true);
        usuarioMapper.guardar(direccion, nuevoUsuario);
        try medicoMapper.guardar(direccion, medico) {
            emit Log("Se guarda la informacion del medico correctamente");
        } catch Error(string memory data) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(data);
        }
    }

    function registrarConStruct(
        address direccion,
        MedicoVO.MedicoVOStruct memory medicoVOStruct,
        string memory _usuario,
        string memory _contrasena // TODO: Recibir encryptada
    ) public {
        bool medicoValido = medicoOraculo.verificarExistenciaEnSistemaExterno(
            _usuario,
            _contrasena
        );
        if (!medicoValido) {
            revert("No existe ese medico para el estado");
        }
        MedicoVO medicoVO = new MedicoVO();
        EstadoVO estadoVO = datosParametricosMapper.consultarEstadoVO(
            medicoVOStruct.estadoId
        );
        TipoIdentificacionVO _tipoIdentificacionVO = datosParametricosMapper
            .consultarTipoIdentificacionVO(
                medicoVOStruct.persona.tipoIdentificacion
            );

        medicoVO.setValuesOfMedicoVOStruct(
            medicoVOStruct,
            estadoVO,
            _tipoIdentificacionVO,
            _usuario,
            _contrasena
        );
        registrar(direccion, medicoVO);
    }

    function actualizar(address direccion, MedicoVO medico) public {
        medicoMapper.actualizar(direccion, medico);
        /*
        try contratoPacienteDAO.actualizar(direccion, paciente) {
            emit Log("Se guarda la informacion de paciente correctamente");
        } catch Error(string memory data) {
            /*reason*/
        /*  emit Log("se rompio por un revert o require");
            emit Log(data);
        }*/
    }

    /*function verificarExistenciaEnSistemaExterno(address direccion)
        public
        returns (bool)
    {
        /* TODO: Consultar info del medico (usuario y contraseña)
         *  despues se hace con oraculos una consulta
         */
    /*
        return true;
    }*/

    /*function buscarPerfilMedicoSistemaExterno(address direccion) public returns (PerfilMedicoSistemaExternoStruct memory){
        // TODO: tambien con oraculo
    }*/

    function setMedicoMapper(MedicoMapperInterface _medicoMapper)
        public
        esPropietario
    {
        medicoMapper = _medicoMapper;
    }

    function setDatosParametricosMapper(
        DatosParametricosMapperInterface _datosParametricosMapperAddress
    ) public esPropietario {
        datosParametricosMapper = _datosParametricosMapperAddress;
    }

    function setMedicoOraculo(MedicoOraculo _medicoOraculo)
        public
        esPropietario
    {
        medicoOraculo = _medicoOraculo;
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

    // TODO: poner en clase generica y reusarlo
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
}
