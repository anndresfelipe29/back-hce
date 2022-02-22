const MedicoMapper = artifacts.require('MedicoMapper');
const MedicoVO = artifacts.require('MedicoVO')
let instance;
let medicoVO;

before(async () => {
    instance = await MedicoMapper.new()
    medicoVO = await MedicoVO.new();
    await medicoVO.setPrimerNombre("Andres");
    await medicoVO.setSegundoNombre("pruebita")
    await medicoVO.setEstadoId("23")
});

contract('MedicoMapper', accounts => {

    it('Se consulta un medico que no existe', async () => {
        try {
            let medico = await instance.consultar(accounts[1]);           
        } catch (err) {
            console.log(err.reason);
            assert(true);
        }
    });

    it('Se registra medico', async () => {
        // Given
        //when
        await instance.guardar(accounts[1], medicoVO.address)
        /*.then(function(events){
            console.log(events)
        })*/
        assert(true);

    });

    it('Se consulta un medico que si existe', async () => {
        let medicoAddress = await instance.consultar.call(accounts[1])
        console.log("---");
        console.log(medicoAddress);
        console.log("---");
        let medico = await MedicoVO.at(medicoAddress)
        console.log("---");
        const nombreResponse = await medico.getPrimerNombre();
        const nombreExpected = await medicoVO.getPrimerNombre();
        console.log(nombreResponse);
        console.log(nombreExpected);
        console.log("---");
        assert(nombreResponse, nombreExpected);

    });

});