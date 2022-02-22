const PacienteMapper = artifacts.require('PacienteMapper');
const PacienteVO = artifacts.require('PacienteVO')
let instance;
let pacienteVO;

before(async () => {
    instance = await PacienteMapper.new()
    pacienteVO = await PacienteVO.new();
    await pacienteVO.setPrimerNombre("Andres");
    await pacienteVO.setSegundoNombre("pruebita")
    await pacienteVO.setEstadoId("23")
});

contract('PacienteMapper', accounts => {

    it('Se consulta un paciente que no existe', async () => {
        try {
            let paciente = await instance.consultar(accounts[2]);
        } catch (err) {
            console.log(err.data);            
            assert(true);
        }
    });

    it('Se registra persona', async () => {
        // Given
        // when
        await instance.guardar(accounts[1], pacienteVO.address)
        /*.then(function(events){
            console.log(events)
        })*/
        assert(true);

    });

    it('Se consulta un paciente que si existe', async () => {
        let pacienteAddress = await instance.consultar.call(accounts[1])
        console.log("---");
        console.log(pacienteAddress);
        console.log("---");
        let paciente = await PacienteVO.at(pacienteAddress)
        console.log("---");
        const nombreResponse = await paciente.getPrimerNombre();
        const nombreExpected = await pacienteVO.getPrimerNombre();
        console.log(nombreResponse);
        console.log(nombreExpected);
        console.log("---");
        assert(nombreResponse, nombreExpected);

    });

});