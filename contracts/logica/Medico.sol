// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/MedicoVO.sol";
import "../persistence/MedicoMapper.sol";
import "../persistence/DatosParametricosMapper.sol";
import "../models/VOGenerales/enums/RolDeAccesoEnum.sol";
import "./Acceso.sol";
import "../utils/Modifiers.sol";
import "../oracles/Oracle.sol";
import "../models/oracles/PeticionExternaEnum.sol";

contract Medico is Modifiers {
    // TODO: consumir este evento desde una clase heredada o algo así
    event Log(string data);
    //address public creador;
    address public medicoMapperAddress;

    MedicoMapperInterface private medicoMapper;
    DatosParametricosMapperInterface private datosParametricosMapper;
    // MedicoOraculo private medicoOraculo;
    RolMapperInterface private rolMapper;
    UsuarioMapperInterface private usuarioMapper;

    Oracle private oraculo;

    constructor() {
        creador = msg.sender;
    }

    function consultar(address direccion)
        public
        tieneAcceso(7)
        returns (MedicoVO.MedicoVOStruct memory)
    {
        emit Log("entro a consultar");
        return medicoMapper.consultar(direccion).getMedicoVOValue();
    }

    function registrar(address direccion, MedicoVO medico)
        public        
    {
        if (direccion != msg.sender) {
            revert("Un medico se debe registrar a si mismo");
        }
        RolVO rol = rolMapper.consultar(RolDeAccesoEnum.MEDICO);
        UsuarioVO nuevoUsuario = new UsuarioVO();
        nuevoUsuario.setDireccion(direccion);
        nuevoUsuario.setRol(rol);
        nuevoUsuario.setEstaActivo(true);
        usuarioMapper.guardar(direccion, nuevoUsuario);
        medicoMapper.guardar(direccion, medico);
        verificarExistenciaEnSistemaExterno(
            direccion
        );
    }

    function registrarConStruct(
        address direccion,
        MedicoVO.MedicoVOStruct memory medicoVOStruct,
        string memory _usuario,
        string memory _contrasena // TODO: Recibir encryptada
    ) public       
    {        
        MedicoVO medicoVO = new MedicoVO();
        EstadoVO estadoVO = datosParametricosMapper.consultarEstadoVO(
            2 // Medico en validación  TODO: convertir en enum
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

    // TODO: Cambiar por struct
    function actualizar(address direccion, MedicoVO medico)
        public
        tieneAcceso(9)
    {
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

    function verificarExistenciaEnSistemaExterno(
        address direccion
        )
        public                
    {
        // tieneAcceso(10)
        /* TODO: Consultar info del medico (usuario y contraseña)
         *  despues se hace con oraculos una consulta
         */

         MedicoVO informacionMedico = medicoMapper.consultar(direccion);

         string memory url = string.concat(
            string.concat(
                string.concat(
                    "http://172.18.0.1:3001/validar-usuario?identificacion=",
                    informacionMedico.getUsuario()
                    ),
            "&contrasena="
            ),
            informacionMedico.getContrasena());

         
         
         oraculo.createRequest(
            url,
            "GET", 
            direccion, 
            PeticionExternaEnum.VALIDAR_MEDICO
            );
    }

    function buscarPerfilMedicoSistemaExterno(address direccion) public 
    tieneAcceso(11) {
        // TODO: tambien con oraculo
        // returns (PerfilMedicoSistemaExternoStruct memory)

         MedicoVO informacionMedico = medicoMapper.consultar(direccion);

         string memory url = string.concat(
            string.concat(
                string.concat(
                    "http://172.18.0.1:3001/buscar-usuario?identificacion=",
                    informacionMedico.getUsuario()
                    ),
            "&contrasena="
            ),
            informacionMedico.getContrasena());

         
         
         oraculo.createRequest(
            url,
            "GET", 
            msg.sender, 
            PeticionExternaEnum.BUSCAR_MEDICO
            );

    }

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

    // Eliminar
    /*function setMedicoOraculo(MedicoOraculo _medicoOraculo)
        public
        esPropietario
    {
        medicoOraculo = _medicoOraculo;
    }*/

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

    function setOracle(Oracle _oracleAddress)
    public
    esPropietario
    {
        oraculo = _oracleAddress;
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }
}
