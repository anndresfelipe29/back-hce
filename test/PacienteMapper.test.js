const PacienteMapper = artifacts.require('PacienteMapper');
const PacienteVO = artifacts.require('PacienteVO')
const MedicoVO = artifacts.require('MedicoVO')
const EstadoVO = artifacts.require('EstadoVO')
let instance;
let pacienteVO;
let estado;

before(async () => {
    instance = await PacienteMapper.new();
    pacienteVO = await PacienteVO.new();
    estado = await EstadoVO.new();
    await pacienteVO.setPrimerNombre("Andres");
    await pacienteVO.setSegundoNombre("pruebita");
    await pacienteVO.setEstado(estado.address)
});

contract('PacienteMapper', accounts => {

    it('Se consulta un paciente que no existe', async () => {
        try {
            let paciente = await instance.consultar(accounts[2]);
        } catch (error) {
            // console.log(error.message);            
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });

    it('Se registra persona', async () => {
        // Given
        // when
        try {
            await instance.guardar(accounts[1], pacienteVO.address)
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

    it('Se actualiza persona', async () => {
        // Given
        await pacienteVO.setSegundoNombre("actualizado");
        // when
        try {
            await instance.actualizar(accounts[1], pacienteVO.address)
            let pacienteAddress = await instance.consultar.call(accounts[1])
            let paciente = await PacienteVO.at(pacienteAddress)          
            assert(paciente, pacienteVO);
        } catch (error) {
            assert.fail('Throw received');
            return;
        }
    });
});