pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

contract Usuario {
    //address public creador;
    struct UsuarioStruct {
        address direccion;
        string rol;
    }
    address private direccion;
    string private rol; // TODO: Cambiar al tipo RolStruct

    constructor() public {
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
