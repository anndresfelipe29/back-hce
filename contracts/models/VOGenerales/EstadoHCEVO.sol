// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract EstadoHCEVO {
    uint256 private id;
    string private nombre;
    string private descripcion;
    bool private estaActivo;

    struct EstadoHCEVOStruct {
        uint256 id;
        string nombre;
        string descripcion;
        bool estaActivo;
    }

    function getEstadoHCEVOValue()
        public
        view
        returns (EstadoHCEVOStruct memory)
    {
        return EstadoHCEVOStruct(id, nombre, descripcion, estaActivo);
    }

    function setValueOfEstadoVOStruct(
        EstadoHCEVOStruct memory estadoHCEVOStruct
    ) public {
        id = estadoHCEVOStruct.id;
        nombre = estadoHCEVOStruct.nombre;
        descripcion = estadoHCEVOStruct.descripcion;
        estaActivo = estadoHCEVOStruct.estaActivo;
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
        estaActivo= _estaActivo;
    }

    function setId(uint256 _id) public {
        id = _id;
    }
}
