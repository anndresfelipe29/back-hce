const RolMapper = artifacts.require('RolMapper');
const RolVO = artifacts.require('RolVO')
const PermisoVO = artifacts.require("PermisoVO");
let instance;
let rolVO;
let estado;
let permisoVO;

before(async () => {
    instance = await RolMapper.new();
    rolVO = await RolVO.new();
    await rolVO.setId(0);
    await rolVO.setNombre("Paciente");
    await rolVO.setDescripcion("Para usuario paciente");

    permisoVO = await PermisoVO.new();
    await permisoVO.setId(23);
    await permisoVO.setNombre("acceso a x cosa");
    await permisoVO.setDescripcion("permisoVO descripcion");
});

contract('RolMapper', accounts => {

    it('Se consulta un rol que no existe', async () => {
        try {
            let rol = await instance.consultar(0);
        } catch (error) {
            // console.log(error.message);            
            assert(true);
            return;
        }
        assert.fail('Expected throw not received');
    });

    it('Se registra rol sin permisos', async () => {
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

    it('Se registra un permiso en un rol que existe', async () => {
        try {
            await rolVO.setPermiso(12, permisoVO.address, true);
            await instance.actualizar(0, rolVO.address);
            assert(true);
        } catch (error) {
            assert.fail('Throw received');
        }


    });

    it('Se registra una lista de permisos en un rol que existe', async () => {
        try {
            await rolVO.setPermisos(
                [
                    [12, permisoVO.address, true],
                    [10, permisoVO.address, true],
                    [15, permisoVO.address, true]
                ]
            );
            await instance.actualizar(0, rolVO.address);
            assert(true);
        } catch (error) {
            assert.fail('Throw received');
        }


    });

    it('Se consulta un rol que si existe', async () => {
        try {
            let rolAddress = await instance.consultar(0)
            let rol = await RolVO.at(rolAddress)
            
            const idResponse = await rol.getId();
            const nombreResponse = await rol.getNombre();
            const permisosResponse = await rol.getPermisos();
            const permisosSizeResponse = await rol.getPermisosSize()
            console.log("--- "+idResponse);
            console.log(nombreResponse);
            console.log(permisosResponse);
            console.log("Size "+permisosSizeResponse);
            /**/
            assert(rol, rolVO);
        } catch (error) {
            assert.fail('Throw received');
        }

    });

});