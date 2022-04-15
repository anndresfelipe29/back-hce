const UsuarioMapper = artifacts.require('UsuarioMapper');
const UsuarioVO = artifacts.require('UsuarioVO')

let instance;
let usuarioVO;
let estado;

before(async () => {
    instance = await UsuarioMapper.new();
    usuarioVO = await UsuarioVO.new();

    await usuarioVO.setDireccion(usuarioVO.address);
    await usuarioVO.setEstaActivo(true);
});

contract('UsuarioMapper', accounts => {

    it('Se consulta un usuario que no existe', async () => {
        try {
            let paciente = await instance.consultar(accounts[2]);
        } catch (error) {
            // console.log(error.message);            
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });

    it('Se registra usuario', async () => {
        // Given
        // when
        try {
            await instance.guardar(accounts[1], usuarioVO.address)
        } catch (error) {
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });

    it('Se consulta un usuario que si existe', async () => {
        try {
            let usuarioAddress = await instance.consultar.call(accounts[1])
            let usuario = await UsuarioVO.at(usuarioAddress)
            /*const nombreResponse = await usuario.getDireccion();
            const nombreExpected = await usuarioVO.getDireccion();
            console.log(nombreResponse);
            console.log(nombreExpected);*/
            assert(usuario, usuarioVO);
        } catch (error) {
            assert.fail('Throw received');
        }

    });

    it('Se actualiza usuario', async () => {
        // Given
        await usuarioVO.setEstaActivo(false);
        // when
        try {
            await instance.actualizar(accounts[1], usuarioVO.address)
            let usuarioAddress = await instance.consultar.call(accounts[1])
            let usuario = await UsuarioVO.at(usuarioAddress)          
            assert(usuario, usuarioVO);
        } catch (error) {
            assert.fail('Throw received');
            return;
        }
    });
});