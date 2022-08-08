// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
// import "../models/RolVO.sol";
// import "./RolMapperInterface.sol";

abstract contract RegistroMedico {
    address public creador;

    uint256 private id;
    uint256 private codPrestadorServicioDeSalud;
    uint256 private fechaRegistro;
    uint256 private tipoRegistroMedico;

    function getId() external view returns (uint256){
        return id;
    }

    function getCodPrestadorServicioDeSalud() external view returns (uint256){
        return codPrestadorServicioDeSalud;
    }

    function getFechaRegistro() public view returns (uint256){
        return fechaRegistro;
    }

    function getTipoRegistroMedico() public view returns (uint256){
        return tipoRegistroMedico;
    }

    function setId(uint256 _id) public{
        id = _id;
    }

    function setCodPrestadorServicioDeSalud(uint256 _codPrestadorServicioDeSalud) public{
        codPrestadorServicioDeSalud = _codPrestadorServicioDeSalud;
    }

    function setFechaRegistro(uint256 _fechaRegistro) public{
        fechaRegistro = _fechaRegistro;
    }

    function setTipoRegistroMedico(uint256 _tipoRegistroMedico) public{
        tipoRegistroMedico = _tipoRegistroMedico;
    }    

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