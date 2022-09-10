// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TipoIdentificacionVO {
    uint256 private id;
    string private nombre;
    string private descripcion;
    bool private estaActivo;

    struct TipoIdentificacionVOStruct {
        uint256 id;
        string nombre;
        string descripcion;
        bool estaActivo;
    }

    function getTipoIdentificacionVOValue() public view returns (TipoIdentificacionVOStruct memory) {
        return TipoIdentificacionVOStruct(
            id, 
            nombre, 
            descripcion, 
            estaActivo
            );
    }

    function setValuesOfTipoIdentificacionStruct(TipoIdentificacionVOStruct memory tipoIdentificacion) public{
        id = tipoIdentificacion.id;
        nombre = tipoIdentificacion.nombre;
        descripcion = tipoIdentificacion.descripcion;
        estaActivo = tipoIdentificacion.estaActivo;
    }

    function getId() public view returns (uint256) {
        return id;
    }

    function getNombre() public view returns (string memory) {
        return nombre;
    }

    function getDescripcion() public view returns (string memory) {
        return descripcion;
    }

    function getEstaActivo() public view returns (bool) {
        return estaActivo;
    }

    function setNombre(string memory _nombre) public {
        nombre = _nombre;
    }

    function setDescripcion(string memory _descripcion) public {
        descripcion = _descripcion;
    }

    function setEstaActivo(bool _estaActivo) public {
        estaActivo = _estaActivo;
    }

    function setId(uint256 _id) public {
        id = _id;
    }
}
