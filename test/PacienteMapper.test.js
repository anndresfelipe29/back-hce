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

contract('PacienteRepository', accounts => {

    it('Se consulta un paciente que no existe', async () => {

        try {
            let paciente = await instance.consultar(accounts[1]);
            console.log("---");
            console.log(paciente);
            console.log("---");

        } catch (err) {
            console.log(err.reason);
            assert(true);
        }
    });

    it('Se registra persona', async () => {
        // Given

        /*
        const nombre = await pacienteVO.getPrimerNombre();
        console.log(nombre);
        console.log("---");
        */
        //when
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