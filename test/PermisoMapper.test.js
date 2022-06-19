const PermisoMapper = artifacts.require('PermisoMapper');
const PermisoVO = artifacts.require("PermisoVO");
let instance;
let permisoVO;

before(async () => {
    instance = await PermisoMapper.new();
    
    permisoVO = await PermisoVO.new();
    await permisoVO.setId(23);
    await permisoVO.setNombre("acceso a x cosa");
    await permisoVO.setDescripcion("permisoVO descripcion");
});

contract('PermisoMapper', accounts => {

    it('Se consulta un permiso que no existe', async () => {
        try {
            let rol = await instance.consultar(0);
        } catch (error) {
            // console.log(error.message);            
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });

    it('Se registra permiso', async () => {
        // Given
        // when
        try {
            await instance.guardar(0, permisoVO.address)
        } catch (error) {
            assert.fail('Throw received');
            return;
        }
        assert(true);
    });

    it('Se consulta un permiso que existe', async () => {
        try {
            let permisoAddress = await instance.consultar(0)
            let permiso = await PermisoVO.at(permisoAddress)
            
            const idResponse = await permiso.getId();
            const nombreResponse = await permiso.getNombre();
            const permisosResponse = await permiso.getDescripcion();
            /*console.log("--- "+idResponse);
            console.log(nombreResponse);
            console.log(permisosResponse);
            */
            assert(permiso, permisoVO);
        } catch (error) {
            assert.fail('Throw received');
        }

    });

    it('Se consultan todos los permisos que existen', async () => {
        try {
            let permisos = await instance.getPermisos()
            const permisosSizeResponse = await instance.getPermisosSize()
            /*
            console.log(permisos);
            console.log("Size "+permisosSizeResponse);
            */
            assert(permisos.length, permisosSizeResponse);
        } catch (error) {
            assert.fail('Throw received');
        }

    });

});