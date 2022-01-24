pragma solidity ^0.8.10; // TODO: Ajustar la versión por consenso con José

import "./Usuario.sol";
import "../models/PersonaStruct.sol";
import "../persistence/PersonaDAO.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
// TODO: verificar si se puede dejar como abstract
contract Persona {
    event Log(string data);

    // TODO: evaluar cuales catch se usan y eliminar los que no se usan

    // TODO: registrar la direccion del contrato personaDAO
    PersonaDAO private personaDao;

    constructor() public {
        // TODO: fijar valor en nulo y cargar el objeto desde un método nuevo con la dirección del contrato desplegado
        personaDao = new PersonaDAO(); //TODO: verificar si queda guardado el objeto o si hay mejor manera
    }

    // function registrar() public virtual returns(Persona); ejemplo de función abstracta
    // function registrar() public virtual;
    function registrar(PersonaStruct memory persona) public {}

    function consultar(address direccion)
        public
        returns (PersonaStruct memory)
    {
        emit Log("entro a consultar");
        try personaDao.consultar(direccion) returns (
            PersonaStruct memory persona
        ) {
            emit Log("encontro la persona");
            return persona;
        } catch Error(string memory e) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(e);
        } catch (bytes memory) {
            /*lowLevelData*/
            emit Log("se rompio y ni idea porque ");
        }
    }

    function guardar(address direccion, PersonaStruct memory persona) public {
        // TODO: Validar, si falla poner excepción
        try personaDao.guardar(direccion, persona) {
            emit Log("Se guarda la persona coreectamente");
        } catch Error(string memory data) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(data);
        } catch (bytes memory) {
            /*lowLevelData*/
            emit Log("se rompio y ni idea porque ");
        }
    }
}

// TODO: intentar separar en otro documento
/*is Persona*/
contract Paciente is Persona {
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
contract Medico is Persona {
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
