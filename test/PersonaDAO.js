const PersonaDAO = artifacts.require('PersonaDAO');
let instance;

beforeEach(async () => {
    instance = await PersonaDAO.new()
});

contract('PersonaDAO', accounts => {
    
    it('Se consulta una persona que si existe', async () => {

        try {
            let persona = await instance.consultar(accounts[1]);
            console.log("---");
            console.log(persona);
            console.log("---");

        } catch (err) {
            console.log(err.reason);
            assert(true);
        }
    });  

    it('Se consulta una persona que no existe', async () => {

        try {
            let persona = await instance.consultar(accounts[1]);
            console.log("---");
            console.log(persona);
            console.log("---");

        } catch (err) {
            console.log(err.reason);
            assert(true);
        }
    });    
    
    /*it('Se registra persona', async () => {
        const personaStruct = { 
            primerNombre: "pipe", 
            segundoNombre: "felipe",
            primerApellido: "g",
            segundoApellido: "sd",
            identificacion: "123",
            tipoIdentificacion: "cc"
        };
        //const personaStruct = Object.create(json)
        console.log(personaStruct)
        console.log(personaStruct.primerNombre)
        const data = ["pipe", "felipe", "g","g","g","g", true]
        await instance.guardar(accounts[1], data).then(function(events){
            console.log(events)
        })

    });
    */

    it('Se registra persona', async () => {
        const personaStruct = { 
            primerNombre: "pipe", 
            segundoNombre: "felipe",
            primerApellido: "g",
            segundoApellido: "sd",
            identificacion: "123",
            tipoIdentificacion: "cc"
        };
        //const personaStruct = Object.create(json)
        console.log(personaStruct)
        console.log(personaStruct.primerNombre)
        const data = ["pipe", "felipe", "primerApellido","segundoApellido","identificacion",["nombre", "descripcion", true], true]
        await instance.guardar(accounts[1], data).then(function(events){
            console.log(events)
        })

    });

});