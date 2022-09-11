// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EstadoCivilVO{ // Actualizar el diagrma de clases
    uint256 private id;
    string private nombre;
    string private descripcion;

    struct EstadoCivilVOStruct {
        uint256  id;
        string  nombre;
        string  descripcion;
        
    }

    function getEstadoCivilVOValue() public view returns (EstadoCivilVOStruct memory) {
        return EstadoCivilVOStruct(
            id,
            nombre,
            descripcion
        );
    }

    function setValueOfEstadoCivilVOStruct(EstadoCivilVOStruct memory estadoCivilVOStruct) public {
        id = estadoCivilVOStruct.id;
        nombre = estadoCivilVOStruct.nombre;
        descripcion = estadoCivilVOStruct.descripcion;
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


    function setNombre(string memory _nombre) public {
        nombre = _nombre;
    }

    function setDescripcion(string memory _descripcion) public {
        descripcion = _descripcion;
    }

    function setId(uint256 _id) public {
        id = _id;
    }
}