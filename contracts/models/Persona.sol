// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./VOGenerales/TipoIdentificacionVO.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
abstract contract Persona {
    event Log(string data);

    address private id;
    string private primerNombre;
    string private segundoNombre;
    string private primerApellido;
    string private segundoApellido;
    string private identificacion;
    TipoIdentificacionVO private tipoIdentificacion;
    bool private isValue;

    struct PersonaStruct {
        address id;
        string primerNombre;
        string segundoNombre;
        string primerApellido;
        string segundoApellido;
        string identificacion;
        address tipoIdentificacion; // TODO: Mejorar
        bool isValue;
    }

    function getPersonaStructValue() public view returns (PersonaStruct memory) {
        return PersonaStruct(
            id,
            primerNombre,
            segundoNombre,
            primerApellido,
            segundoApellido,
            identificacion,
            address(tipoIdentificacion),
            isValue
        );
    }

    function setValuesOfPersonaStruct(PersonaStruct memory persona) public {
        id = persona.id;
        primerNombre = persona.primerNombre;
        segundoNombre = persona.segundoNombre;
        primerApellido = persona.primerApellido;
        segundoApellido = persona.segundoApellido;
        identificacion = persona.identificacion;
        isValue = persona.isValue;
        tipoIdentificacion= TipoIdentificacionVO(persona.tipoIdentificacion);

    }

    function getId() public view returns (address) {
        return id;
    }

    function getPrimerNombre() public view returns (string memory) {
        return primerNombre;
    }

    function getSegundoNombre() public view returns (string memory) {
        return segundoNombre;
    }

    function getPrimerApellido() public view returns (string memory) {
        return primerApellido;
    }

    function getSegundoApellido() public view returns (string memory) {
        return segundoApellido;
    }

    function getIdentificacion() public view returns (string memory) {
        return identificacion;
    }

    function getTipoIdentificacionId()
        public
        view
        returns (TipoIdentificacionVO)
    {
        return tipoIdentificacion;
    }

    function getIsValue() public view returns (bool) {
        return isValue;
    }

    function setId(address _id) public {
        id = _id;
    }

    function setPrimerNombre(string memory _primerNombre) public {
        primerNombre = _primerNombre;
    }

    function setSegundoNombre(string memory _segundoNombre) public {
        segundoNombre = _segundoNombre;
    }

    function setPrimerApellido(string memory _primerApellido) public {
        primerApellido = _primerApellido;
    }

    function setSegundoApellido(string memory _segundoApellido) public {
        segundoApellido = _segundoApellido;
    }

    function setIdentificacion(string memory _identificacion) public {
        identificacion = _identificacion;
    }

    function setTipoIdentificacionId(TipoIdentificacionVO _tipoIdentificacion)
        public
    {
        tipoIdentificacion = _tipoIdentificacion;
    }

    function setIsValue(bool _isValue) public {
        isValue = _isValue;
    }
}
