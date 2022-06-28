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

    acceso = await Acceso.at("0xFb7AEC04d9f393d02d86179A514E3FcbC93881FE");
    //usuarioMapper = await UsuarioMapper.new();
    usuarioMapper = await UsuarioMapper.at("0xc9087934d9A9Cd019EC33eA1848EDe49c649D163");
    rolMapper = await RolMapper.at("0x85A1e1439f1849331ebdcE851E663FB3a65E3616");
    pacienteMapper = await PacienteMapper.at("0xd202dA95352CEE87d53Ae92b086F239902c19164");
    paciente = await Paciente.at("0x37015cbfD13C75aBE796c25474E0568af5c33925");

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
            [2, permisoY.address, false],
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
    /*await rolMapper.guardar(1, rolPaciente.address);
    await rolMapper.guardar(2, rolMedico.address);
    */


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
    await pacienteVO.setIdentificacion("1111666123");
    await pacienteVO.setEstado(estado.address);

    await paciente.registrar(accounts[2], pacienteVO.address, { from: accounts[2] })
    
    // Medico
    

});

contract('init', accounts => {

    it('Se cargo la data', async () => {
        console.log("Success")
    });
});