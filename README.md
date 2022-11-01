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
(0) 0x0bc9d65134da89bccf1de4adeb89cc051544864a2b265820bd9d49636884f207
(1) 0xb1a7e4437b1e308f89dacbc9bcd06a6d5615262735582987f38c9b55b1783ef2
(2) 0xf8c43404095bedb3789a98d335580dde21000612dab7ec0e064e0af5e39a97aa
(3) 0x99afb8f2361df77414ad02b4307d88c29fcc666a97ad4bc9bced6e4c3d8c8ef4
(4) 0x15795a146a6472c7822462754af0873165876ab0e620181af8d3a370a7cce066
(5) 0xcd6de38ef0224805a673d9eca27e1a8b8ab79c51af06bff79c4581cf46574d8f
(6) 0x0059d9703baedca2a308cf9fec33df9f0233fcceaf7ab3414205f6c39d67654b
(7) 0x1b2c61a0e5af18c850b420e3e54f6a6cc32b596b3e58674a27d55751e221fb4f
(8) 0xfb4c574d0408f8ef5e0f8187c636e878272ed3d41792b69d56884fa067c87538
(9) 0x0ea7585ee6657af655606ace9548f40fc38eb042eb78e8af3ffbf418d9fcad67

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
