// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./RegistroMedicoIterator.sol";
import "../../models/historiaClinica/RegistroMedico.sol";
import "../../models/historiaClinica/enums/TipoRegistroEnum.sol";

contract FiltroTipoRegistroMedicoIterator  is RegistroMedicoIterator{
    /* TODO: Ajustar que las creaciones de estos objetos, pueden ser muy costosos 
     si quedan en storge
     */
    address public creador;

    TipoRegistroMedico tipoRegistroMedico;

    RegistroMedico[]  todosLosRegistros;
    RegistroMedico siguiente;
    uint256 posicionActual=0;
    uint256 posicionSiguiente=0;

    constructor(
        RegistroMedico[] memory _todosLosRegistros,
        TipoRegistroMedico _tipoRegistroMedico
        ) {
        creador = msg.sender; // creador del contrato
        todosLosRegistros = _todosLosRegistros;
        tipoRegistroMedico = _tipoRegistroMedico;
    }

    function hasMore() public override returns(bool){
        uint256 posicion = posicionActual;
        while (posicion < todosLosRegistros.length ) {
            if(todosLosRegistros[posicion].getTipoRegistroMedico() == tipoRegistroMedico) {
                posicionSiguiente = posicion;
                return true;
            }
            posicion++;
        }
        return false;
    }

    function getNext() public override returns(RegistroMedico) {        
        if(hasMore()){
            RegistroMedico registroMedico = todosLosRegistros[posicionSiguiente];
            posicionActual = posicionSiguiente;         
            return registroMedico;
        } 
        revert("No hay un siguiente");
    }

    function selfDestruct() public {
        selfdestruct(payable(creador));
    }

    
}