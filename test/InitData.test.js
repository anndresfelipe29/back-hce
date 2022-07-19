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

let instance;
let usuarioVO;
let estado;
let acceso;
let paciente;
let medico;
let pacienteMapper

// TODO: se supone que son pruebas unitarias, pero esta esta tiene pinta de integración, si algo hacer mocks despues para pulir
before(async () => {
    const accounts = await web3.eth.getAccounts()

    //usuarioMapper = await UsuarioMapper.new();    
    rolMapper = await RolMapper.at("0x1fa5430b62383d1B2D06c5a1364bF49C6bCbb104");
    pacienteMapper = await PacienteMapper.at("0x0E64d151DF3d00c06637C7DC909e59FF82966813");

    usuarioMapper = await UsuarioMapper.at("0x5404172F6a48788F5E0Db4935568bfF2888da2A4");
    acceso = await Acceso.at("0xeE5Bf4301eAf5f10314113F3eAA812705919a77E");
    await acceso.setUsuarioMapper(usuarioMapper.address)

    paciente = await Paciente.at("0x39E8C7bc796B6162C60b53747D4e36934fb007f7");

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
    await rolMapper.guardar(1, rolPaciente.address);
    await rolMapper.guardar(2, rolMedico.address);
   


    // Paciente
    await paciente.setPacienteMapper(pacienteMapper.address)
    await paciente.setRolMapper(rolMapper.address)
    await paciente.setUsuarioMapper(usuarioMapper.address)
    await paciente.setAcceso(acceso.address)

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
    let tipoIdentificacionVO = await TipoIdentificacionVO.new()
    await tipoIdentificacionVO.setId(1);
    await tipoIdentificacionVO.setNombre("Cedula");
    await pacienteVO.setTipoIdentificacionId(tipoIdentificacionVO.address);

    await paciente.registrar(accounts[2], pacienteVO.address, { from: accounts[2] })
    
    // Medico
    

});

contract('init', accounts => {

    it('Se cargo la data', async () => {
        console.log("Success")
    });
});