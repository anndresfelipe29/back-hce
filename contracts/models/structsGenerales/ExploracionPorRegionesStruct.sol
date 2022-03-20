// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

struct ExploracionPorRegionesStruct {
    string cabeza;
    string cuello;
    string abdomen;
    string torax;
    string genitales;
    string miembros;
    SignosVitalesStruct signosVitalesStruct; 
}

struct SignosVitalesStruct{
    uint256 frecuenciaCardiaca;
    uint256 frecuenciaRespiratoria;
    string tensionArterial;
    uint peso; // TODO verificar como son los double y float aqui
    uint temperatura;
}