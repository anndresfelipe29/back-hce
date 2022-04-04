## tipos de catch solidity

         personaDao.consultar(direccion) returns (
            PersonaStruct memory persona
        ) {
            emit Log("encontro la persona");
            return persona;
        } catch Error(string memory e) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(e);
        } catch (bytes memory) {
            /*lowLevelData*/
            emit Log("se rompio y ni idea porque ");
        }



## Funciones abstractas 

 function registrar() public virtual returns(Persona); ejemplo de función abstracta
 function registrar() public virtual;