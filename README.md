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
(0) 0xf3ed0e632031cda47ad34b5acf60204811bdf8d25050f44320c6cdcd8384aa4c
(1) 0x228737d58f98aa74a3189875bf2a024e4e447cd63b193000403af776b44db4c5
(2) 0xfa43fec2e3131068a27848315284adc508c427a84ee5ab50a9043d4cde2af82a
(3) 0x6cdba78dcf6a1eb958dc4901f18300d20a511d72db825ce138f0bb4be72301d2
(4) 0xfd53483122d3fa896038a68c9277f6cf6db60744eca367d5d26f7f77bf7bbdb5
(5) 0xb0c271d92bae09a0b26fe9ca59969cc719de83313f40d37817c69f5cf9db310f
(6) 0x03b5cbd9e735b4dd383e3de8e8af1487f511f33db736faf58cf45a8b6cce30f8
(7) 0x40d01a11c4478c3df161eb36608fa358aeb974b1ef537d57e159a63b0bc0351c
(8) 0x3104a703ca0f98abd7b0bdb6b431846effda612091a72a2e44f967e5db26f8f9
(9) 0xb7c03cc210a16cfa508ea31260add501957742eb5752ba75b7f3ef90ad3b00e0

HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
