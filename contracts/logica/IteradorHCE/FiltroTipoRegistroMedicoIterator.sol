pragma solidity ^0.8.10;

import "./RegistroMedicoIterator.sol";
import "../../models/historiaClinica/RegistroMedico.sol";

contract FiltroTipoRegistroMedicoIterator  is RegistroMedicoIterator{
    /* TODO: Ajustar que las creaciones de estos objetos, pueden ser muy costosos 
     si quedan en storge
     */
    RegistroMedico[]  todosLosRegistros;
    RegistroMedico siguiente;
    uint256 posicionActual=0;

    function hasMore() public override returns(bool){
        return posicionActual<todosLosRegistros.length;
    }

    function getNext() public override returns(RegistroMedico) {
        /**TODO: Ver como se puede cambiar o ajustar este parametro */
        uint256 tipo = posicionActual;
        if(hasMore()){
            posicionActual = posicionActual + 1;
            RegistroMedico regMedico = todosLosRegistros[posicionActual];
            if(regMedico.getTipoRegistroMedico()==tipo){
                siguiente = todosLosRegistros[posicionActual];
            }
            return siguiente;
        } else {
            revert("No hay un siguiente");
        }
        
    }

    
}