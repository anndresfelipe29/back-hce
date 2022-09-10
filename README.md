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
(0) 0x97bc1af940cb11606ae8de0c147c13c8f0d029466d255acc4bc4d7b9691a1774
(1) 0xa15aa568d2d2d337d3eb328f3278ad27ddf8721d1446f8a0c197ccbf1b151c83
(2) 0xbc48ae06908e24331f26ab51828fc739d75f98446c1dedf3a6a0fa468ad1bf8c
(3) 0x2edafd6271e75fbf7e4fff60d6b9a191316a8bd30c20e26edd23ab45377bc3a7
(4) 0xaedd71dbe82b1dcc7a98a90de645706ff9f116b01f4de61a9f7c879b7816a952
(5) 0x8d3c35ffc62ef9554b883c0c45ff4e3bdf2a8d99738699fd2888e4c4e32f7a06
(6) 0x57b4304066b0d2121dd5c0ffab2e365874dcd518c193dfcb1ecc16f87e5ac296
(7) 0x8836253e2efa29226f70badca474384f053c3c11bceddac1c6bedf4fdb3a896b
(8) 0xe9d5313615984ef49a9c7b3d52671fd7f1dd539624c58ea19dfa8750e41bc948
(9) 0x3a5f780f9f96b8def00e56603865aa9bfccb83b7e62982663626b1e567b4d7db

HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
