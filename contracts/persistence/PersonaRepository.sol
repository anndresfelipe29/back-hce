// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
//import "../models/PersonaStruct.sol";
import "../models/PersonaVO.sol";

// TODO: hacer un name resgistry para validar que solo los contratos del proyecto y el propietario puedan acceder a las funciones
contract PersonaRepository {
    // event Log(address indexed user,  string data);
    event Log(string data);

    address public creador;

    // mapping(address => PersonaStruct) private personas; // TODO: Dejar como private
    mapping(address => PersonaVO) private personas; // TODO: Dejar como private

    constructor() {
        creador = msg.sender;
    }

    // TODO: si no es external fallan los try catch, investigar al respecto
    function consultar(address direccion) external returns (PersonaVO) {
        emit Log("entro a consultar");
        PersonaVO persona = personas[direccion];
        if (!persona.getIsValue()) {
            emit Log("no existe el usuario");
            revert("No existe ese paciente");
        }
        emit Log("usuario valido");
        return persona;
    }

    function guardar(address direccion, PersonaVO persona) public {
        // TODO: quitar return en clase de enterprise architect
        // TODO: Validar, si falla poner excepción
        /*if (personas[direccion].getIsValue()) {
            emit Log("Ya existe una persona registrada con ese address");
            revert("Ya existe uan persona registrada con ese address");
        }*/
        string memory nombre = persona.getPrimerNombre();
        bool estado = persona.getIsValue();
        personas[direccion] = persona;
    }

    function actualizar(address direccion, PersonaVO persona) public {
        // TODO: quitar return en clase de enterprise architect
        // TODO: Validar, si falla poner excepción
        if (!personas[direccion].getIsValue()) {
            emit Log("No existe una persona registrada con ese address");
            revert("No existe una persona registrada con ese address");
        }
        personas[direccion] = persona;
    }

    // TODO: agregar función actualizar

    modifier esPropietario() {
        // NOTE: Los string no pueden llevar acentos, encontrar una forma de usarlos
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
