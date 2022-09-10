# back-hce
Back end solidity para DAPP de historias clínicas

## Ejecución en local

- Instala ganache CLI y ejecuta:

    ganache-cli -p 7545 -g 20  

- Despliege de contratos con:
    
    truffle compile

    truffle migrate -f 3 --to 3 
- Carga de datos iniciales e interconexión de contratos:

    truffle exec ./scripts/initial.js 

- Carga de usuarios por defecto
    Cuenta 8 paciente
    Cuenta 9 médico

    truffle exec ./scripts/usuariosDefault.js 

const accounts = await web3.eth.getAccounts() 

million benefit runway donor there gold cause ensure account decorate venture wonder

Private Keys
==================
(0) 0xd4e3b1ab4d0fa3b3b875676683c7a051a585dbd1017b74c4ec1e6cfc341dadb8
(1) 0x275547aec624e2de0975793611b5cf50852b8c778b1598ee33caef3efef39d43
(2) 0x08e2253f235c89fdc35314f15c0662cca9b22559f9f6bef3f0757085e61e4a2b
(3) 0x8ba5ee0c806d87a4157d957bebd284fe385761189a02d936fb3f8a9058521b5c
(4) 0xcf7b9c27c12418c883245dadf2d1fd4b9fc6b6cf9a54afc653d2d5bc58480bd4
(5) 0x97033089e966785ecdb40d20a599a8aaac45ec8d4c67d41094047192b939b2d5
(6) 0x011251633ad2edbd80fc9bdf2cedfbbc91b72bacd07018cafdaee5f189c95b2c
(7) 0xdc04d23b460e2b45e03f0a3390111a503af4a5da5f40be1775f3a4bb610fec67
(8) 0xdf7ea3da8531f36805add3b8e3d6f27b143bb8140fb5337d314e113829adcde4
(9) 0x4e267e59f5d7601b9f991c3562269cda89dbdf482dca50e6349526d27792f342

HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
