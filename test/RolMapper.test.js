const RolMapper = artifacts.require('RolMapper');
const RolVO = artifacts.require('RolVO')
let instance;
let pacienteVO;
let estado;

before(async () => {
    instance = await RolMapper.new();
    rolVO = await RolVO.new();
    await rolVO.setNombre("Paciente");
    await rolVO.setDescripcion("Para paciente");
});

contract('RolMapper', accounts => {

    it('Se consulta un paciente que no existe', async () => {
        try {
            let rol = await instance.consultar(0);
        } catch (error) {
            // console.log(error.message);            
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });

    it('Se registra rol', async () => {
        // Given
        // when
        try {
            await instance.guardar(0, rolVO.address)
        } catch (error) {
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });

    it('Se consulta un paciente que si existe', async () => {
        try {
            let pacienteAddress = await instance.consultar.call(accounts[1])
            let paciente = await PacienteVO.at(pacienteAddress)
            const nombreResponse = await paciente.getPrimerNombre();
            const nombreExpected = await pacienteVO.getPrimerNombre();
            assert(paciente, pacienteVO);
        } catch (error) {
            assert.fail('Throw received');
        }

    });

});