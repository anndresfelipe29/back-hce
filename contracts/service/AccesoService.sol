pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

import "../logica/Persona.sol";


contract AccesoService {
    address public creador;

    PersonaDAO private personaDao;

    constructor() public {
        creador = msg.sender; // creador del contrato
        personaDao = new PersonaDAO(); //TODO: verificar si queda guardado el objeto o si hay mejor manera
        // TODO: quiza deba aplicar singleton a los dao para no tener multiples listas con diferente información
    }

    function login() public returns (PersonaStruct memory) {
        address direccion = msg.sender;
        // TODO: buscar persona en arreglo
        return personaDao.consultar(direccion);
    }

    /*
    // TODO: buscar porque es uint256
    function buscarPermisosDeRol(uint256 funcionId) public view returns(bool){
        address direccion = msg.sender;
        // TODO: esto es como un filtro (averiguar si lo hay en solidity) y sirve para ver si un usario tiene acceso a x metodo
    }
    */
}
