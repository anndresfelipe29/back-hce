const PacienteMapper = artifacts.require('PacienteMapper');
const UsuarioMapper = artifacts.require('UsuarioMapper');
const RolMapper = artifacts.require('RolMapper');
const PermisoVO = artifacts.require("PermisoVO");
const PacienteVO = artifacts.require('PacienteVO');
const RolVO = artifacts.require('RolVO')
const UsuarioVO = artifacts.require('UsuarioVO');
const EstadoVO = artifacts.require('EstadoVO');
const Acceso = artifacts.require('Acceso');
const Paciente = artifacts.require('Paciente');
const TipoIdentificacionVO = artifacts.require('TipoIdentificacionVO');

let instance;
let pacienteVO;
let estado;
let acceso;
let usuarioMapper;

before(async () => {
    instance = await Paciente.new();
    usuarioMapper = await UsuarioMapper.new();
    rolMapper = await RolMapper.new();
    pacienteMapper = await PacienteMapper.new();
    acceso = await Acceso.new();

    await acceso.setUsuarioMapper(usuarioMapper.address);

    // Permisos
    permisoX = await PermisoVO.new();
    await permisoX.setId(1);
    await permisoX.setNombre("paciente.consultar");
    await permisoX.setDescripcion("acceso a consultar solo para médico");

    permisoY = await PermisoVO.new();
    await permisoY.setId(2);
    await permisoY.setNombre("paciente.consultar (sin parametros)");
    await permisoY.setDescripcion("acceso a consultar solo para paciente");

    permisoZ = await PermisoVO.new();
    await permisoZ.setId(3);
    await permisoZ.setNombre("paciente.actualizar");
    await permisoZ.setDescripcion("acceso para paciente y medico");

    permisoW = await PermisoVO.new();
    await permisoW.setId(4);
    await permisoW.setNombre("paciente.cambiarEstado");
    await permisoW.setDescripcion("acceso solo para el medico");

    // Roles
    rolPaciente = await RolVO.new();
    await rolPaciente.setId(1);
    await rolPaciente.setNombre("Paciente");
    await rolPaciente.setDescripcion("Para usuario paciente");
    await rolPaciente.setPermisos(
        [
            [1, permisoX.address, false],
            [2, permisoY.address, true],
            [3, permisoZ.address, true],
            [4, permisoZ.address, false]
        ]
    );

    rolMedico = await RolVO.new();
    await rolMedico.setId(2);
    await rolMedico.setNombre("Medico");
    await rolMedico.setDescripcion("Para usuario medico");
    await rolMedico.setPermisos(
        [
            [1, permisoX.address, true],
            [2, permisoY.address, true],
            [3, permisoZ.address, true],
            [4, permisoZ.address, true]
        ]
    );
    await rolMapper.guardar(1, rolPaciente.address);
    await rolMapper.guardar(2, rolPaciente.address);

    // Usuario
    usuarioPaciente = await UsuarioVO.new();
    await usuarioPaciente.setDireccion(usuarioPaciente.address);
    await usuarioPaciente.setEstaActivo(true);
    await usuarioPaciente.setRol(rolPaciente.address);

    usuarioMedico = await UsuarioVO.new();
    await usuarioMedico.setDireccion(usuarioMedico.address);
    await usuarioMedico.setEstaActivo(true);
    await usuarioMedico.setRol(rolMedico.address);

    const accounts = await web3.eth.getAccounts()
    await usuarioMapper.guardar(accounts[0], usuarioPaciente.address)
    await usuarioMapper.guardar(accounts[1], usuarioMedico.address)


});

contract('Paciente', accounts => {

    it('Se inyectan address correctos', async () => {
        try {
            await instance.setPacienteMapper(pacienteMapper.address)
            await instance.setRolMapper(rolMapper.address)
            await instance.setUsuarioMapper(usuarioMapper.address)
            await instance.setAcceso(acceso.address)
        } catch (error) {
            console.log("error correcto: " + error.message);
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });
    
    it('Se consulta un paciente que no existe, desde una cuenta de médico', async () => {
        try {
            let pacienteAddress = await instance.consultar(accounts[0], { from: accounts[1] });
            // let paciente = await PacienteVO.at(pacienteAddress);
            // console.log("Address: " + pacienteAddress);
            //console.log("paciente: " + paciente);
        } catch (error) {
            // console.log(error.message);
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });

    it('Se consulta un paciente, desde una cuenta de otro paciente', async () => {
        try {
            let pacienteAddress = await instance.consultar(accounts[3], { from: accounts[0] });
            // let paciente = await UsuarioVO.at(pacienteAddress);
            // console.log("Address: "+ pacienteAddress);
            // console.log("paciente: " + paciente);
        } catch (error) {
            // console.log(error.message);            
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });

    it('Se registra persona (la cuenta a registrar es la misma que hace la peticion)', async () => {
        // Given
        pacienteVO = await PacienteVO.new();
        estado = await EstadoVO.new();
        await pacienteVO.setId(accounts[2]);
        await pacienteVO.setPrimerNombre("Andres");
        await pacienteVO.setSegundoNombre("pruebita");
        await pacienteVO.setPrimerApellido("Gomez");
        await pacienteVO.setSegundoApellido("Salinas");
        await pacienteVO.setIdentificacion("1111666123");
        await pacienteVO.setEstado(estado.address);
        let tipoIdentificacionVO = await TipoIdentificacionVO.new();
        await tipoIdentificacionVO.setId(1);
        await tipoIdentificacionVO.setNombre("Cedula");
        await pacienteVO.setTipoIdentificacionId(tipoIdentificacionVO.address);
        // when
        try {
            await instance.registrar(accounts[2], pacienteVO.address, { from: accounts[2] })
        } catch (error) {
            console.log(error.message);
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });
    

    it('Se registra persona con struct (la cuenta a registrar es la misma que hace la peticion)', async () => {
        // Given
        
        let tipoIdentificacionVO = await TipoIdentificacionVO.new();
        let estadoVO = await EstadoVO.new();
        // when
        try {
            await instance.registrarConStruct(accounts[4], [[accounts[4], "Andres","struct", "Gomas", "test", "111111",tipoIdentificacionVO.address, "true"],[1, 1, 12, 25, "Bogota", "ocupacion","direccion","3150 000",1,2,3], estadoVO.address], { from: accounts[4] })
        } catch (error) {
            console.log(error.message);
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });

    it('Se registra persona (la cuenta a registrar es diferente la que hace la peticion)', async () => {
        // Given
        pacienteVO = await PacienteVO.new();
        estado = await EstadoVO.new();
        await pacienteVO.setId(accounts[2]);
        await pacienteVO.setPrimerNombre("Andres");
        await pacienteVO.setSegundoNombre("pruebita");
        await pacienteVO.setPrimerApellido("Gomez");
        await pacienteVO.setSegundoApellido("Salinas");
        await pacienteVO.setIdentificacion("1111666123");
        await pacienteVO.setEstado(estado.address);
        let tipoIdentificacionVO = await TipoIdentificacionVO.new();
        await tipoIdentificacionVO.setId(1);
        await tipoIdentificacionVO.setNombre("Cedula");
        await pacienteVO.setTipoIdentificacionId(tipoIdentificacionVO.address);

        // when
        try {
            await instance.registrar(accounts[3], pacienteVO.address, { from: accounts[2] })
        } catch (error) {
            // console.log(error.message);
            // console.log(error);
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });

    it('Se consulta un paciente, desde la cuenta de un médico', async () => {
        try {
            let pacienteAddress = await instance.consultar.call(accounts[2], { from: accounts[1] });
            // let paciente = await PacienteVO.at(pacienteAddress);
            // let nombre = await paciente.getPrimerNombre();
            // console.log("Address: "+ pacienteAddress);
            // console.log("paciente: " + paciente);
            // console.log("paciente: " + nombre);
        } catch (error) {
            console.log(error.message);
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });

    it('Un paciente consulta su cuenta', async () => {
        try {
            console.log("-------------------------")
            let pacienteAddress = await instance.consultar.call({ from: accounts[2] });
            console.log("---------- debug: " + pacienteAddress);
            // let paciente = await PacienteVO.at(pacienteAddress);
            // let nombre = await paciente.getPrimerNombre();
            // console.log("Address: "+ pacienteAddress);
            // console.log("paciente: " + paciente);
            // console.log("paciente: " + nombre);
        } catch (error) {
            console.log(error.message);
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });

    it('Un paciente actualiza su cuenta', async () => {
        try {
            await pacienteVO.setSegundoApellido("Gumble");
            await instance.actualizar(pacienteVO.address, { from: accounts[2] });
            // let nombre = await paciente.getPrimerNombre();
            // console.log("Address: "+ pacienteAddress);
            // console.log("paciente: " + paciente);
            // console.log("paciente: " + nombre);
        } catch (error) {
            console.log(error.message);
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });

    it('Un médico cambia el estado de un paciente (activo o inactivo)', async () => {
        try {
            let nuevoEstado = await EstadoVO.new();
            await instance.cambiarEstado(
                accounts[2],
                nuevoEstado.address,
                { from: accounts[1] }
            );
            // let nombre = await paciente.getPrimerNombre();
            // console.log("Address: "+ pacienteAddress);
            // console.log("paciente: " + paciente);
            // console.log("paciente: " + nombre);
        } catch (error) {
            console.log(error.message);
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });
});

/*
paciente.registrarConStruct(accounts[4], [[accounts[4], "Andres","struct", "Gomas", "test", "111111",tipoIdentificacionVO.address, "true"],[1, 1, 12, 25, "Bogota", "ocupacion","direccion","3150 000",1,2,3], estadoVO.address], { from: accounts[4] })
*/