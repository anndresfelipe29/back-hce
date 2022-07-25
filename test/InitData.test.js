const PermisoMapper = artifacts.require('PermisoMapper');
const PermisoVO = artifacts.require("PermisoVO");
const RolMapper = artifacts.require('RolMapper');
const RolVO = artifacts.require('RolVO')
const UsuarioMapper = artifacts.require('UsuarioMapper');
const UsuarioVO = artifacts.require('UsuarioVO');
const Acceso = artifacts.require('Acceso');

const EstadoVO = artifacts.require('EstadoVO');
const PacienteVO = artifacts.require('PacienteVO');
const PacienteMapper = artifacts.require('PacienteMapper');
const Paciente = artifacts.require('Paciente');
const TipoIdentificacionVO = artifacts.require('TipoIdentificacionVO');
const DatosParametricosMapper = artifacts.require('DatosParametricosMapper')


let instance;
let usuarioVO;
let estado;
let acceso;
let paciente;
let medico;
let pacienteMapper;
let datosParametricosMapper;

// TODO: se supone que son pruebas unitarias, pero esta esta tiene pinta de integración, si algo hacer mocks despues para pulir
before(async () => {
    const accounts = await web3.eth.getAccounts()

    //usuarioMapper = await UsuarioMapper.new();    
    rolMapper = await RolMapper.deployed();
    pacienteMapper = await PacienteMapper.deployed();
    datosParametricosMapper = await DatosParametricosMapper.deployed();
    console.log("------------- " + rolMapper.address)
    usuarioMapper = await UsuarioMapper.deployed();
    acceso = await Acceso.deployed();
    await acceso.setUsuarioMapper(usuarioMapper.address)

    // Paciente
    paciente = await Paciente.deployed();
    await paciente.setPacienteMapper(pacienteMapper.address)
    await paciente.setRolMapper(rolMapper.address)
    await paciente.setUsuarioMapper(usuarioMapper.address)
    await paciente.setAcceso(acceso.address)

    // Permisos
    permisoX = await PermisoVO.new();
    await permisoX.setId(1);
    await permisoX.setNombre("acceso a x cosa");
    await permisoX.setDescripcion("descripcion de x cosa");

    permisoY = await PermisoVO.new();
    await permisoY.setId(2);
    await permisoY.setNombre("acceso a Y cosa");
    await permisoY.setDescripcion("descripcion de Y cosa");

    permisoZ = await PermisoVO.new();
    await permisoZ.setId(3);
    await permisoZ.setNombre("acceso a Z cosa");
    await permisoZ.setDescripcion("descripcion de Z cosa");

    // Roles
    rolPaciente = await RolVO.new();
    await rolPaciente.setId(1);
    await rolPaciente.setNombre("Paciente");
    await rolPaciente.setDescripcion("Para usuario paciente");
    await rolPaciente.setPermisos(
        [
            [1, permisoX.address, true],
            [2, permisoY.address, true],
            [3, permisoZ.address, false]
        ]
    );

    rolMedico = await RolVO.new();
    await rolMedico.setId(2);
    await rolMedico.setNombre("Medico");
    await rolMedico.setDescripcion("Para usuario medico");
    await rolMedico.setPermisos(
        [
            [1, permisoX.address, false],
            [2, permisoY.address, true],
            [3, permisoZ.address, true]
        ]
    );

    // Registro en rol mapper
    await rolMapper.guardar(rolPaciente.address);
    await rolMapper.guardar(rolMedico.address);

    let cedulaTipoIdentificacionVO = await TipoIdentificacionVO.new()
    await cedulaTipoIdentificacionVO.setId(1);
    await cedulaTipoIdentificacionVO.setNombre("Cedula");
    await cedulaTipoIdentificacionVO.setDescripcion("Cedula descripcion");
    await cedulaTipoIdentificacionVO.setEstaActivo(true);

    let tarjetaIdentidadTipoIdentificacionVO = await TipoIdentificacionVO.new()
    await tarjetaIdentidadTipoIdentificacionVO.setId(2);
    await tarjetaIdentidadTipoIdentificacionVO.setNombre("Tarjeta de identidad");
    await tarjetaIdentidadTipoIdentificacionVO.setDescripcion("Tarjeta de identidad descripcion");
    await tarjetaIdentidadTipoIdentificacionVO.setEstaActivo(true);

    let cedulaid = await datosParametricosMapper.guardarTipoIdentificacionVO.call(cedulaTipoIdentificacionVO.address);
    let tarjetaIdentidadId =await datosParametricosMapper.guardarTipoIdentificacionVO.call(tarjetaIdentidadTipoIdentificacionVO.address);
    console.log("Cedula: " + cedulaid)
    console.log("Tarjeta de identidad: " + tarjetaIdentidadId)
/*
    // Se registra paciente
    pacienteVO = await PacienteVO.new();
    estado = await EstadoVO.new();
    await pacienteVO.setId(accounts[2]);
    await pacienteVO.setPrimerNombre("Andres");
    await pacienteVO.setSegundoNombre("pruebita");
    await pacienteVO.setPrimerApellido("Gomez");
    await pacienteVO.setSegundoApellido("Salinas");
    await pacienteVO.setIdentificacion("1111666123");
    await pacienteVO.setEstado(estado.address);
    
    await pacienteVO.setTipoIdentificacionId(cedulaTipoIdentificacionVO.address);

    await paciente.registrar(accounts[2], pacienteVO.address, { from: accounts[2] })
    
    // Medico
 */   

});

contract('init', accounts => {

    it('Se cargo la data', async () => {
        console.log("Success")
    });
});