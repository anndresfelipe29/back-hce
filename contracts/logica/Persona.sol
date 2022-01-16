pragma solidity >=0.4.22 <0.9.0; // TODO: Ajustar la versión por consenso con José

import './Usuario.sol';
import './Paciente.sol';

abstract contract Persona {
    // address public creador;

    string private primerNombre;       
    string private segundoNombre;
    string private primerApellido;
    string private segundoApellido;
    string private identificacion;
    // TipoIdentificacionStruct public tipoIdentificacion; // TODO: cambiar tipo por el de la estructura más adelante
    string public tipoIdentificacion;
    Usuario public accesoUsuario;

    // function registrar() public virtual returns(Persona); ejemplo de función abstracta
    function registrar() public returns(bool){
        // Persona persona = new Paciente();
        return true;
    }

    function getAccesoUsuario() public view returns(string memory) {
        return primerNombre;
    }

    function setAccesoUsuario(Usuario newMessage) public  {
        accesoUsuario = newMessage;
    }

    function getIdentificacion() public view returns(string memory) {
        return identificacion;
    }

    function setIdentificacion(string memory newMessage) public  { // TODO: investigar porque se pone memery en el arametros del método 
        identificacion = newMessage;
    }

    function getPrimerApellido() public view returns(string memory) {
        return primerApellido;
    }

    function setPrimerApellido(string memory newMessage) public  { 
        primerApellido = newMessage;
    }

    function getPrimerNombre() public view returns(string memory) {
        return primerNombre;
    }
    
    function setPrimerNombre(string memory newMessage) public  { 
        primerNombre = newMessage;
    }

    function getSegundoApellido() public view returns(string memory) {
        return segundoApellido;
    }
    
    function setSegundoApellido(string memory newMessage) public  { 
        segundoApellido = newMessage;
    }

    function getSegundoNombre() public view returns(string memory) {
        return segundoNombre;
    }
    
    function setSegundoNombre(string memory newMessage) public  { 
        segundoNombre = newMessage;
    }

    function getTipoIdentificacion() public view returns(string memory) {
        return tipoIdentificacion;
    }
    
    function setTipoIdentificacion(string memory newMessage) public  { 
        tipoIdentificacion = newMessage;
    }
}