// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract AseguradoraVO {
    uint256 private id;
    string private nombre;
    bool private estaActivo;
   
    struct AseguradoraVOStruct {
        uint256 id;
        string nombre;
        bool estaActivo;
    }

    function getAseguradoraVOValue()
        public
        view
        returns (AseguradoraVOStruct memory)
    {
        return AseguradoraVOStruct(id, nombre, estaActivo);
    }

    function setValueOfAseguradoraVOStruct(
        AseguradoraVOStruct memory aseguradoraVOStruct
    ) public {
        id = aseguradoraVOStruct.id;
        nombre = aseguradoraVOStruct.nombre;
        estaActivo = aseguradoraVOStruct.estaActivo;
    }

    function getId() public view returns (uint256) {
        return id;
    }

    function getNombre() public view returns (string memory) {
        return nombre;
    }

    function getEstaActivo() public view returns (bool) {
        return estaActivo;
    }

    function setNombre(string memory _nombre) public {
        nombre = _nombre;
    }

    function setEstaActivo(bool _estaActivo) public {
        estaActivo= _estaActivo;
    }

    function setId(uint256 _id) public {
        id = _id;
    }
}
