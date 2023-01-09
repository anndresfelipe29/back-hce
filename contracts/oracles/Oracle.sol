// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../utils/Modifiers.sol";
import "../models/oracles/PeticionExternaEnum.sol";
import "../persistence/MedicoMapper.sol";

contract Oracle is Modifiers{

  MedicoMapperInterface private medicoMapper;

  uint numRequests;
  mapping (uint => Request) requests; //list of requests made to the contract
  uint currentId = 0; //increasing request id
  uint minQuorum = 1; // TODO: poner en 2 //minimum number of responses to receive before declaring final result
  uint totalOracleCount = 3; // Hardcoded oracle count

  mapping(address => uint256) private oraculos;
  address[] private idOraculos;



  // defines a general api request
  struct Request {
    uint id;                            //request id
    string urlToQuery;                  //API url
    string attributeToFetch;            //json attribute (key) to retrieve in the response
    string agreedValue;                 //value from key
    address interested;                 //interesado en la información
    PeticionExternaEnum cause;           //Causa por la cual se usa el oraculo
    mapping(uint => string) anwers;     //answers provided by the oracles
    mapping(address => uint) quorum;    //oracles which will query the answer (1=oracle hasn't voted, 2=oracle has voted)
  }

  //event that triggers oracle outside of the blockchain
  event NewRequest (
    uint id,
    string urlToQuery,
    string attributeToFetch
  );

  //triggered when there's a consensus on the final result
  event UpdatedRequest (
    uint id,
    string urlToQuery,
    string attributeToFetch,
    string agreedValue,
    address interested,
    PeticionExternaEnum cause  
  );

  constructor() {
        creador = msg.sender;
    }

  function createRequest (
    string memory _urlToQuery,
    string memory _attributeToFetch,
    address interested,
    PeticionExternaEnum cause  
  )
  public
  {
    Request storage r = requests[numRequests++];
    r.id = currentId;
    r.urlToQuery = _urlToQuery;
    r.attributeToFetch = _attributeToFetch;  
    r.interested = interested;
    r.cause = cause;
    // Hardcoded oracles address
    for(uint256 i=0; i < idOraculos.length; i++) {
      if (oraculos[idOraculos[i]] == 1) {
        r.quorum[idOraculos[i]] = 1;
      }
      
    }
    // r.quorum[address(0x6c2339b46F41a06f09CA0051ddAD54D1e582bA77)] = 1;
    // r.quorum[address(0xb5346CF224c02186606e5f89EACC21eC25398077)] = 1;
    // r.quorum[address(0xa2997F1CA363D11a0a35bB1Ac0Ff7849bc13e914)] = 1;

    // launch an event to be detected by oracle outside of blockchain
    emit NewRequest (
      currentId,
      _urlToQuery,
      _attributeToFetch
    );

    // increase request id
    currentId++;
  }

  //called by the oracle to record its answer
  function updateRequest (
    uint _id,
    string memory _valueRetrieved
  ) public {

    Request storage currRequest = requests[_id];

    //check if oracle is in the list of trusted oracles
    //and if the oracle hasn't voted yet
    if(currRequest.quorum[address(msg.sender)] == 1){

      //marking that this address has voted
      currRequest.quorum[msg.sender] = 2;

      //iterate through "array" of answers until a position if free and save the retrieved value
      uint tmpI = 0;
      bool found = false;
      while(!found) {
        //find first empty slot
        if(bytes(currRequest.anwers[tmpI]).length == 0){
          found = true;
          currRequest.anwers[tmpI] = _valueRetrieved;
        }
        tmpI++;
      }

      uint currentQuorum = 0;

      //iterate through oracle list and check if enough oracles(minimum quorum)
      //have voted the same answer has the current one
      for(uint i = 0; i < totalOracleCount; i++){
        bytes memory a = bytes(currRequest.anwers[i]);
        bytes memory b = bytes(_valueRetrieved);

        if(keccak256(a) == keccak256(b)){
          currentQuorum++;          
        }
      }

    if(currentQuorum >= minQuorum){
      currRequest.agreedValue = _valueRetrieved;
      emit UpdatedRequest (
        currRequest.id,
        currRequest.urlToQuery,
        currRequest.attributeToFetch,              
        currRequest.agreedValue,
        currRequest.interested,
        currRequest.cause
      );
    }

    }
  }

  // TODO: Validar que tan viable es esto
 /* function nextStep(
    address interested,
    PeticionExternaEnum cause,
    string memory answer
    ) public{

    if(cause == PeticionExternaEnum.VALIDAR_MEDICO) {
      // cambia estado en médico
      MedicoVO informacionMedico = medicoMapper.consultar(direccion);
      informacionMedico.estado = 



    } else if(cause == PeticionExternaEnum.BUSCAR_MEDICO) {
      // No hace nada
      
    }
  }*/


  function updateRequestMedico(
    uint _id,
    // string memory _valueRetrieved
    string[] memory _keys
  ) public {
    // updateReques(_id, _valueRetrieved);
    Request storage currRequest = requests[_id];
    //if(currRequest.agreedValue)
    for(uint256 i = 0; i < _keys.length; i++) {
      emit UpdatedRequest (
        i,
        "pipe prueba",
        currRequest.attributeToFetch,              
        _keys[i],
        currRequest.interested,
        currRequest.cause
      );
    }

  }



  /***
  * 1. Activo
  * 2. Inactivo
  */
  function setOraculo(address _oraculoAddress, uint256 estado)
      public
      esPropietario
  {
      if (oraculos[_oraculoAddress] == 0) {
         // revert("Ya existe un medico registrado con ese address");
         idOraculos.push(_oraculoAddress);
      } 
      if(estado != 1){
        oraculos[_oraculoAddress] = 2;
      }
      oraculos[_oraculoAddress] = estado;

  }

}
