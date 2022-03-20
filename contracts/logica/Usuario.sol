pragma solidity ^0.8.10;

contract Usuario {
    //address public creador;
    /*struct UsuarioStruct {
        address direccion;
        string rol;
    }*/
    address private direccion;
    string private rol; // TODO: Cambiar al tipo RolStruct

    constructor() {
        //creador = msg.sender; // creador del contrato
    }

    function getDirecion() public view returns (address) {
        return direccion;
    }

    function setDirecion(address newMessage) public {
        direccion = newMessage;
    }

    function getRol() public view returns (string memory) {
        return rol;
    }

    function setRol(address newMessage) public {
        direccion = newMessage;
    }
}
