// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
import "../models/historiaClinica/HistoriaClinicaVO.sol";
import "./HistoriaClinicaMapperInterface.sol";

contract HistoriaClinicaMapper is HistoriaClinicaMapperInterface {
    address public creador;

    mapping(address => HistoriaClinicaVO) private historiasClinicas;
    address[] private addressList; // NOTE Mapped Structs with Index

    constructor() {
        creador = msg.sender;
    }

    function consultar(address direccion) external view returns (HistoriaClinicaVO) {
        HistoriaClinicaVO historiasClinica = historiasClinicas[direccion];
        if (address(historiasClinica) == address(0)) {
            revert("No existe esa historia clinica");
        }
        return historiasClinica;
    }

    function guardar(address direccion, HistoriaClinicaVO _historiaClinicaVO) public {
        if (address(historiasClinicas[direccion]) != address(0)) {
            emit Log("Ya existe una historia clinica registrada con ese address");
            revert("Ya existe una historia clinica registrada con ese address");
        }
        historiasClinicas[direccion] = _historiaClinicaVO;
        addressList.push(direccion);
    }

    function actualizar(address direccion, HistoriaClinicaVO _historiaClinicaVO) public {
        if (address(historiasClinicas[direccion]) == address(0)) {
            revert("No existe una historia clinica registrada con ese address");
        }
        historiasClinicas[direccion] = _historiaClinicaVO;
    }

    function size() external view returns(uint){
        return addressList.length;
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
