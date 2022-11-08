// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

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
    uint peso;
    uint temperatura;
}