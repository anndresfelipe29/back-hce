pragma solidity ^0.8.10;

import "./RegistroMedicoIterator.sol";
import "../../models/historiaClinica/RegistroMedico.sol";

contract FiltroFechaRegistroMedicoIterator  is RegistroMedicoIterator{
    /* TODO: Ajustar que las creaciones de estos objetos, pueden ser muy costosos 
     si quedan en storge
     */
    RegistroMedico[]  todosLosRegistros;
    RegistroMedico siguiente;
    uint256 posicionActual=0;

    function hasMore() public override returns(bool){
        bool hayNuevoRegistro = false;
        for (
            uint256 i = posicionActual;
            i < todosLosRegistros.length - 1;
            i++
        ) {
            posicionActual = i+1;
            // if con lo que quiero validar
            if(true){
                siguiente = todosLosRegistros[i];
                return true;
            }
            
        }
        
        return false;
    }

    function getNext() public override returns(RegistroMedico) {
        if(hasMore()){
            return siguiente;
        } else {
            revert("No hay un siguiente");
        }
        
    }

    
}