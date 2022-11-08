# back-hce
Back end solidity para DAPP de historias clínicas

## Ejecución en local

- Instala ganache CLI y ejecuta:

    ganache-cli -p 7545 -g 20  

- Esta variante del comando permite conservar siempre que se reinicie la blockchain las mismas cuentas
    ganache-cli  --logging.debug -p 7545 -g 20 -m "dolphin person hammer artwork lens century mass agent climb into unusual dose"

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
(0) 0x1556acee690d9438d3e5da97d68d21fdac97c2c613f7f97e9724f18dda6ecf3f
(1) 0x1db746c19de0226851d7961b21f455b4059dc438a4a50f455b8ab0cce6291691
(2) 0xdd248fa9d933d08a8a3ec5a1b3dfe69ed70b9ad3f42291f8a92f0e6ea900aaf6
(3) 0x2500ac77c93a69b97601b7dcb7dc33b7a070a11a3224fc82fbbb9ddfbd9d2520
(4) 0xdfcf70f956f80158845d81aafacebd816d1f34c41a1c035c9d1108b76cfbbf73
(5) 0xbe8752fdd111197adde68a2a5584012ed7aba2c6f1ed73af01d90214c55be54f
(6) 0x17c38e53f85d95110b50bfbfe05b1dfdf10607f747aa1cc96c44fb2f95add78e
(7) 0x5d2df374a9bf2b81d44f9c89f570b846c8518f0e219893178744e24b94695edb
(8) 0xcc66989f25b39bba7bd0615044630b1474f085d40d9eb8b5ac193eb8991b273b
(9) 0x542a094909ebb0607fe20bc5f44e19f3b873d88dfc17bc0158e278f8fbaac2b7

HD Wallet
==================
Mnemonic:      prefer oil domain local battle suspect april affair leopard pond slush reward

HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
