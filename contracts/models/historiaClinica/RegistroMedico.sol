// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// import "../logica/Persona.sol";
// import "../models/RolVO.sol";
// import "./RolMapperInterface.sol";
import "./enums/TipoRegistroEnum.sol";

abstract contract RegistroMedico {
    address public creador; // TODO: Ajustar quien es el creador o dueño

    uint256 private id;
    address private codPrestadorServicioDeSalud;
    int256 private fechaRegistro;
    TipoRegistroMedico private tipoRegistroMedico;

    struct RegistroMedicoStruct {
        uint256 id;
        address codPrestadorServicioDeSalud;
        int256 fechaRegistro;
        TipoRegistroMedico tipoRegistroMedico;
    }

    constructor(TipoRegistroMedico _tipoRegistroMedico) {
        tipoRegistroMedico = _tipoRegistroMedico;
    }

    function getRegistroMedico() public view returns(RegistroMedicoStruct memory){
        return RegistroMedicoStruct(id, codPrestadorServicioDeSalud, fechaRegistro, tipoRegistroMedico);
    }

    function setRegistroMedico(RegistroMedicoStruct memory registro) public {
        id = registro.id;
        codPrestadorServicioDeSalud = registro.codPrestadorServicioDeSalud;
        fechaRegistro = registro.fechaRegistro;
        tipoRegistroMedico = registro.tipoRegistroMedico;
    }

    function getId() external view returns (uint256) {
        return id;
    }

    function getCodPrestadorServicioDeSalud() external view returns (address) {
        return codPrestadorServicioDeSalud;
    }

    function getFechaRegistro() public view returns (int256) {
        return fechaRegistro;
    }

    function getTipoRegistroMedico() public view returns (TipoRegistroMedico) {
        return tipoRegistroMedico;
    }

    function setId(uint256 _id) public {
        id = _id;
    }

    function setCodPrestadorServicioDeSalud(
        address _codPrestadorServicioDeSalud
    ) public {
        codPrestadorServicioDeSalud = _codPrestadorServicioDeSalud;
    }

    function setFechaRegistro(int256 _fechaRegistro) public {
        fechaRegistro = _fechaRegistro;
    }

    function setTipoRegistroMedico(TipoRegistroMedico _tipoRegistroMedico) public {
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
