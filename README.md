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
(0) 0x7345b6cc5d41eeff94bac4ad5e88fea3cca22585d62f6bd0c689a8de790cb9d0
(1) 0x52126bdbb0b0919057ef05d44714ce8a49a7f0a77cf6ecb255a4bf513960b994
(2) 0x6ff1c8ffd5875fc0524a39cb9ecfaf640cbca3f59b6bb7e03be66040e58efa82
(3) 0x9e4fe9d3d044eb579293002d3c85881b5f7cb818f98c47123a26421640c4a388
(4) 0xea5d3493ded447f0316cbc5e44a5ad3d96e95ae539d8e5b09601f4e132428498
(5) 0x20c4c4b9783f5da09a733258dba0883f01237da0350efa26d29ebddc57ddba70
(6) 0x7f18e330272ba097ea3fc1914cd1fc45b15203af0d80ea0ec639bc0499a61695
(7) 0xf525108a029dce7730f06764a6032ff9a45aaebff8fd22e9395b05a84d4b2791
(8) 0x2aaee81fb61d5f5fcf1ebb61428cb392cc735bdf588a1c0eb6fe22988ca9e498
(9) 0x9ee15e78a1d014927694d59fdb3c5e80ec7820c122718111b2df212b2b6c2612

HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
