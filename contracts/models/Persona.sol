// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./VOGenerales/TipoIdentificacionVO.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
abstract contract Persona {

    address private direccion;
    uint256 private id;
    string private primerNombre;
    string private segundoNombre;
    string private primerApellido;
    string private segundoApellido;
    string private identificacion;
    TipoIdentificacionVO private tipoIdentificacion;
    bool private isValue;

    struct PersonaStruct {
        address direccion;
        uint256 id;
        string primerNombre;
        string segundoNombre;
        string primerApellido;
        string segundoApellido;
        string identificacion;
        // address tipoIdentificacion; // TODO: Mejorar
        uint256 tipoIdentificacion;
        bool isValue;
    }

    constructor() {
        //direccion = address(this);
    }

    function getPersonaStructValue() public view returns (PersonaStruct memory) {
        return PersonaStruct(
            direccion,
            id,
            primerNombre,
            segundoNombre,
            primerApellido,
            segundoApellido,
            identificacion,
            tipoIdentificacion.getId(),
            // address(tipoIdentificacion),
            isValue
        );
    }

    function setValuesOfPersonaStruct(PersonaStruct memory _persona, TipoIdentificacionVO _tipoIdentificacionVO) public {
        id = _persona.id;
        primerNombre = _persona.primerNombre;
        segundoNombre = _persona.segundoNombre;
        primerApellido = _persona.primerApellido;
        segundoApellido = _persona.segundoApellido;
        identificacion = _persona.identificacion;
        isValue = _persona.isValue;
        tipoIdentificacion= _tipoIdentificacionVO;
        direccion = _persona.direccion;

    }

    function getDireccion() public view returns (address) {
        return direccion;
    }

    function getId() public view returns (uint256) {
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

    function setDireccion(address _direccion) public {
        direccion = _direccion;
    }

    function setId(uint256 _id) public {
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
