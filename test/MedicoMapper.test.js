const MedicoMapper = artifacts.require('MedicoMapper');
const MedicoVO = artifacts.require('MedicoVO')
const EstadoVO = artifacts.require('EstadoVO')
let instance;
let medicoVO;

before(async () => {
    instance = await MedicoMapper.new()
    medicoVO = await MedicoVO.new();
    estado = await EstadoVO.new();
    await medicoVO.setPrimerNombre("Andres");
    await medicoVO.setSegundoNombre("pruebita")
    await medicoVO.setEstado(estado.address)
});

contract('MedicoMapper', accounts => {

    it('Se consulta un medico que no existe', async () => {
        try {
            let medico = await instance.consultar(accounts[1]);
        } catch (err) {
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });

    it('Se registra medico', async () => {
        // Given
        //when
        try {
            await instance.guardar(accounts[1], medicoVO.address)
        } catch (error) {
            assert.fail('Throw received');
            return;
        }
        assert(true);

    });

    it('Se consulta un medico que si existe', async () => {
        try {
            let medicoAddress = await instance.consultar.call(accounts[1])
            let medico = await MedicoVO.at(medicoAddress)
            const nombreResponse = await medico.getPrimerNombre();
            const nombreExpected = await medicoVO.getPrimerNombre();
            assert(medico, medicoVO);
        } catch (error) {
            assert.fail('Throw received');
        }

    });

    it('Se actualiza medico', async () => {
        // Given
        await medicoVO.setSegundoNombre("actualizado");
        // when
        try {
            await instance.actualizar(accounts[1], medicoVO.address)
            let medicoAddress = await instance.consultar.call(accounts[1])
            let medico = await MedicoVO.at(medicoAddress)          
            assert(medico, medicoVO);
        } catch (error) {
            assert.fail('Throw received');
            return;
        }
    });

});