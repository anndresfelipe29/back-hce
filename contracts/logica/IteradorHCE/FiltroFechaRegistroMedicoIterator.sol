// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedicoIterator.sol";
import "../../models/historiaClinica/RegistroMedico.sol";

contract FiltroFechaRegistroMedicoIterator is RegistroMedicoIterator {
    /* TODO: Ajustar que las creaciones de estos objetos, pueden ser muy costosos 
     si quedan en storge
     */

    address public creador;

    RegistroMedico[] todosLosRegistros;
    RegistroMedico siguiente;
    uint256 posicionActual = 0;

    constructor() {
        creador = msg.sender; // creador del contrato
    }

    function hasMore() public view override returns (bool) {
        return posicionActual < todosLosRegistros.length;
    }

    function getNext() public override returns (RegistroMedico) {
        int256 fechaActual = int256(block.timestamp);
        if (hasMore()) {
            posicionActual = posicionActual + 1;
            RegistroMedico regMedico = todosLosRegistros[posicionActual];
            if (regMedico.getFechaRegistro() == fechaActual) {
                siguiente = todosLosRegistros[posicionActual];
            }
            return siguiente;
        } else {
            selfDestruct();
            // revert("No hay un siguiente");
        }
    }

    // Agregar un self destruct para matarlo al finalizar

    function selfDestruct() public {
        selfdestruct(payable(creador));
    }
}
