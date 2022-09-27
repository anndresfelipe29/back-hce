pragma solidity ^0.8.17;

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
        return posicionActual<todosLosRegistros.length;
    }

    function getNext() public override returns(RegistroMedico) {
        uint fechaActual = block.timestamp;
        if(hasMore()){
            posicionActual = posicionActual + 1;
            RegistroMedico regMedico = todosLosRegistros[posicionActual];
            if(regMedico.getFechaRegistro()==fechaActual){
                siguiente = todosLosRegistros[posicionActual];
            }
            return siguiente;
        } else {
            revert("No hay un siguiente");
        }        
    }
    // Agregar un self destruct para matarlo al finalizar

    
}