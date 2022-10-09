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
(0) 0x1ed1a46178b4db75e98eb4ed17815c1b0530cda6db83e63c13e59d531415731d
(1) 0x76a6266452206ff260c498ababddff1e387bf06e5181f4350f2e7a09c6d6024a
(2) 0xfe959ed2ea30123c0b4252907381565bf3af4400624d2578a3950b364570fa09
(3) 0x7269c8b10258bd016632bfaa68af468876ec992864826d572a631df5d0adc928
(4) 0x21626a8e7468069414bc0a96e216a33e1e49bf081a8e1a9c550455076e07256b
(5) 0x830d1cffd17e57fcd77a042cbf899862d026713300c47f5b9e1a0a58eb55f814
(6) 0xb09eb042b2c10f0a6be1e3e5ddc2f3f7fc7779507868e88b61d5387419d97fe3
(7) 0x1b4963601f68d8c1d8c8a4edde202f3fc605885902d96739979898d39def02fd
(8) 0xca27e78595ea61410a2f3a55bdd88ac620d3cbccd588e75d72a1175af97b09b8
(9) 0xa43054069bbecc13c422cc9d46f205e03efe3831391e3f91383bf1b9f748021e


HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
