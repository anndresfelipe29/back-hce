pragma solidity >=0.5.0 <0.9.0; // TODO: Ajustar la versión por consenso con José

import "./Usuario.sol";

// NOTE: se deja el abstrac contrac justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"

abstract contract Persona {
    // address public creador;
    string private primerNombre;
    string private segundoNombre;
    string private primerApellido;
    string private segundoApellido;
    string private identificacion;
    // TipoIdentificacionStruct public tipoIdentificacion; // TODO: cambiar tipo por el de la estructura más adelante
    string private tipoIdentificacion;
    Usuario private accesoUsuario;

    /*
    // function registrar() public virtual returns(Persona); ejemplo de función abstracta
    function registrar() public returns(bool){
        // Persona persona = new Paciente();
        return true;
    }
*/
    function getAccesoUsuario() public view returns (string memory) {
        return primerNombre;
    }

    function setAccesoUsuario(Usuario newMessage) public {
        accesoUsuario = newMessage;
    }

    function getIdentificacion() public view returns (string memory) {
        return identificacion;
    }

    function setIdentificacion(string memory newMessage) public {
        // TODO: investigar porque se pone memery en el arametros del método
        identificacion = newMessage;
    }

    function getPrimerApellido() public view returns (string memory) {
        return primerApellido;
    }

    function setPrimerApellido(string memory newMessage) public {
        primerApellido = newMessage;
    }

    function getPrimerNombre() public view returns (string memory) {
        return primerNombre;
    }

    function setPrimerNombre(string memory newMessage) public {
        primerNombre = newMessage;
    }

    function getSegundoApellido() public view returns (string memory) {
        return segundoApellido;
    }

    function setSegundoApellido(string memory newMessage) public {
        segundoApellido = newMessage;
    }

    function getSegundoNombre() public view returns (string memory) {
        return segundoNombre;
    }

    function setSegundoNombre(string memory newMessage) public {
        segundoNombre = newMessage;
    }

    function getTipoIdentificacion() public view returns (string memory) {
        return tipoIdentificacion;
    }

    function setTipoIdentificacion(string memory newMessage) public {
        tipoIdentificacion = newMessage;
    }
}

contract Paciente is Persona {
    address public creador;

    // EstadoStruct private estado;
    uint256 private historiaClinicaId;

    // DatosPersonales private datosPersonales;

    constructor() public {
        creador = msg.sender; // creador del contrato
    }
}

contract Medico is Persona {
    address public creador;

    // EstadoStruct private estado;
    string private especialidad;
    string private usuario;
    string private contrasena;

    struct PerfilMedicoSistemaExternoStruct {
        string primerNombre;
        string segundoNombre;
        string primerApellido;
        string segundoApellido;
        string identificacion; // TODO: agregar tipo de identificacion
        string especialidad;
    }

    constructor() public {
        creador = msg.sender; // creador del contrato
    }

    function login() public returns (Persona) {
        address direccion = msg.sender;
        // TODO: buscar persona en arreglo
    }

    // TODO: buscar porque es uint256
    function buscarPermisosDeRol(uint256 funcionId) public view returns (bool) {
        address direccion = msg.sender;
        // TODO: esto es como un filtro (averiguar si lo hay en solidity) y sirve para ver si un usario tiene acceso a x metodo
    }
}
