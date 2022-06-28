const PermisoMapper = artifacts.require('PermisoMapper');
const PermisoVO = artifacts.require("PermisoVO");
const RolMapper = artifacts.require('RolMapper');
const RolVO = artifacts.require('RolVO')
const UsuarioMapper = artifacts.require('UsuarioMapper');
const UsuarioVO = artifacts.require('UsuarioVO');
const Acceso = artifacts.require('Acceso');

let instance;
let usuarioVO;
let estado;

// TODO: se supone que son pruebas unitarias, pero esta esta tiene pinta de integración, si algo hacer mocks despues para pulir
before(async () => {

    instance = await Acceso.new();
    //usuarioMapper = await UsuarioMapper.new();
    usuarioMapper = await UsuarioMapper.at("0xCff3965fd0b45C848a2f5B00ddc18b7f982992fB");


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

contract('Acceso', accounts => {

    /*
    it('Se inyecta un address incorrecto', async () => {
        // TODO intentar controlar cuando se inyecte un mapper incorrecto
        try {
            var data =  await instance.setUsuarioMapper(usuarioMedico.address)
            //console.log("incorrecto: " + data)
        } catch (error) {
            // console.log("error incorrecto: " +error.message);            
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });
    */

    it('Se inyecta un address correcto', async () => {
        try {
            var data = await instance.setUsuarioMapper(usuarioMapper.address)
            console.log("correcto: " + data)
        } catch (error) {
            console.log("error correcto: " + error.message);
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });

    it('Login un usuario que no existe', async () => {
        try {
            let usuarioAddress = await instance.login({ from: accounts[2] });
        } catch (error) {
            // console.log("Error: "+error.message);            
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });

    it('Login un usuario que existe', async () => {
        try {
            let usuarioAddress = await instance.login.call({ from: accounts[0] });
            // let usuario = await UsuarioVO.at(usuarioAddress);
            console.log("Usuario: "+ usuarioAddress)
            // console.log("Address: "+ usuarioAddress);
            // console.log("usuario: " + usuario);
        } catch (error) {
            // console.log("Usuario existe:  "+ error.message)
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });

    it('Validación de permiso de rol', async () => {
        // Given
        // when
        try {
            var boolResponse1 = await instance.validarPermisoDeRol.call(accounts[0], 1)
            var boolResponse2 = await instance.validarPermisoDeRol.call(accounts[0], 2)
            var boolResponse3 = await instance.validarPermisoDeRol.call(accounts[1], 2)
             console.log("Response 1: "+ boolResponse1);
             console.log("Response 2: "+ boolResponse2);
             console.log("Response 3: "+ boolResponse3);

            if (!boolResponse1 || boolResponse2 || !boolResponse3) {
                 
                assert.fail('wrong answer');
                return;
            }
        } catch (error) {
            console.log("Error:  "+ error.message)
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });
});