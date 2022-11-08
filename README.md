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
(0) 0x5a0028c0aa8745a8286e789b2130cff6951277e70667f32080cae8bd630f166a
(1) 0xb13d7a7c7836f7fb8e9aaf1ee5857e6f7a412c984eac4a07f0e318657e323bc5
(2) 0x1183a0eea32644634ecd9f290e1b8e52659bbe8632c090824cce7110b411814a
(3) 0x85cfafc741b898ce84d1c7f017fa5c52614e66c65ea969be815f53b2944f8dd7
(4) 0xd5caf9649ee707ee1e0ffed4d6bd23f2d08d243018953c60b6fbe1aaca60a54b
(5) 0xe7accbd82cdd2acede3ce0c389bb087cc76f648199f04f1ddbeab02c6aef0da9
(6) 0x3695d4241eb8c7061aea2a717a0798936cff7d8d279b0b34c8b27383e778d0ad
(7) 0x3259e61b9b59875fa9e6f5275314faf6e85bb6f659889330f9df396e993a4b11
(8) 0x5a2e05651c6b5bae152ace0d7941572686b41597a97d7f877c77fea751f272c8
(9) 0x739c5c1e86413bb07c69f3d33982336cc68a4bd74d97f82ec37bd50986254b9b

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
