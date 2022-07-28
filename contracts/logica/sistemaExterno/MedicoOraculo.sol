pragma solidity ^0.8.10;

import "../../models/PerfilMedicoSistemaExternoVO.sol";

/*
import "../../persistence/MedicoMapper.sol";
import "../../persistence/DatosParametricosMapper.sol";
import "../../persistence/DatosParametricosMapperInterface.sol";
*/
contract MedicoOraculo {
    // TODO: consumir este evento desde una clase heredada o algo así
    event Log(string data);
    address public creador;

    constructor() {
        creador = msg.sender; // creador del contrato
    }

    function verificarExistenciaEnSistemaExterno(string memory _usuario, string memory _contrasena)
        public
        returns (bool)
    {
        emit Log("entro a consultar");
        return true;
    }

    function consultarRethus(address direccion)
        public
        returns (bool)
    {
        /* TODO: Consultar info del medico (usuario y contraseña)
         *  despues se hace con oraculos una consulta
         */
        return true;
    }

    /*function buscarPerfilMedicoSistemaExterno(address direccion) public returns (PerfilMedicoSistemaExternoStruct memory){
        // TODO: tambien con oraculo
    }*/


    // TODO: poner en clase generica y reusarlo
    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }
}
