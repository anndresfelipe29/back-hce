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
(0) 0x207506072d89be6d9cf67f7f6e0173edce6bdd262a4d6788e798ac0f9ccfc4d3
(1) 0xfcc01571b17e85d78d37e6e7a4484229b130bd91ada292a0575d3b4a8e242803
(2) 0xca4cbf9579223105284d6fd3c174fb4f388a4f5e9583faa0adcdf38210d68be3
(3) 0x4f31c8045a4584b4ccf45dfd5d3d0e38ead6033fd5251c78a1ed1fd7ba920272
(4) 0xdb0797a0e996fe2842c9e825133784781b9cffce67012af1064d47ec631beea7
(5) 0xb95cf85d0607d90c1db52290a73cc5a4faba9b463c03630efa1f456f0993e756
(6) 0xb7620940d384f913d2560f55fe141d5bee33853206b3a0e2546d896db43d43c7
(7) 0xba07143291fa48ec96b628525abd7c6d451118393780fa8b7935ac1860807bd4
(8) 0x4e25239b5a67e115f49160489399967eb1a46d34201a3005d67b86f0edfa01c0
(9) 0x7f2ef2b932f55f77cc1292c31637bd2e4e1d7b27a79bc6fcd8d2d56751e025b2

HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
