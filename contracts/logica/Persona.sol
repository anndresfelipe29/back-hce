pragma solidity >=0.5.0 <0.9.0; // TODO: Ajustar la versión por consenso con José

import "./Usuario.sol";
import "../models/PersonaStruct.sol";

// NOTE: se deja el abstrac contrac justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"

abstract contract Persona {
    event Log(string data);

    // TODO: registrar la direccion del contrato personaDAO 

    // function registrar() public virtual returns(Persona); ejemplo de función abstracta
    // function registrar() public virtual;
    function registrar(PersonaStruct memory persona) public {}

    function consultar(address direccion)
        public
        returns (PersonaStruct memory)
    {
        emit Log("entro a consultar");
        try personaDao.consultar(direccion) returns (
            Persona.PersonaStruct memory persona
        ) {
            // Paciente paciente = new Paciente();
            // paciente.setPrimerApellido(persona.getPrimerApellido()); // acá se rompe
            emit Log("encontro la persona");
            return persona;
        } catch Error(
            string memory /*reason*/
        ) {
            emit Log("se rompio por un revert o require");
        } catch (
            bytes memory /*lowLevelData*/
        ) {
            emit Log("se rompio y ni idea porque ");
        }
    }

    function guardar(address direccion, PersonaStruct memory persona) public {
        // TODO: quitar return en clase de enterprise architect
        // TODO: Validar, si falla poner excepción
        personas[direccion] = persona;
    }
}

// TODO: intentar separar en otro documento
/*is Persona*/
contract Paciente {
    // address public creador;
    struct PacienteStruct {
        PersonaStruct persona;
        uint256 historiaClinicaId;
    }

    // EstadoStruct private estado;

    // DatosPersonales private datosPersonales;

    constructor() public {
        // creador = msg.sender; // creador del contrato
    }
}

/*is Persona*/
contract Medico {
    address public creador;

    struct MedicoStruct {
        PersonaStruct persona;
        string especialidad;
        string usuario;
        string contrasena;
    }

    // EstadoStruct private estado;

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

    function login() public view returns (Persona) {
        address direccion = msg.sender;
        // TODO: buscar persona en arreglo
    }

    // TODO: buscar porque es uint256
    function buscarPermisosDeRol(uint256 funcionId) public view returns (bool) {
        address direccion = msg.sender;
        // TODO: esto es como un filtro (averiguar si lo hay en solidity) y sirve para ver si un usario tiene acceso a x metodo
    }
}
