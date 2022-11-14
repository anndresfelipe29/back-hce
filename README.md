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
(0) 0xa93fab169aba251e47612822d0ffed72ebc9f282cc274d07b082ff06f4c0a081
(1) 0x50df9cad6c378eb25ff365c9fb690d7c827b839d586061e57f686fc16b78a753
(2) 0x8e5442ec5149400019f184bb8ff7431a057e8aaf621688d45e6246337da92cdd
(3) 0xe969d5105c25fc89b43e4e621d9f30d1dd1d4a9d459c05d218928cdd5e38949d
(4) 0x0d8f9aa0e2e31aa398e15357a338fe51f8050c0b075ba8ef6b82013d4f1d365c
(5) 0x34a2c6b34e894b70ddf31449eb6fa481785c7c5400622a3f9a6f031252c35d5a
(6) 0x9aae07beba9693d11ca2af51d61d83a5d7c50ed0f2d07acdf0206bc2ec52b6c8
(7) 0xb406898731091d0789b0a84462b77da1f5c947c137610c30677460c7bd4a364d
(8) 0xded81586b173fe010d3c865de5b5e1afdd9b4ae43375d95414e9708ba5b06725
(9) 0xff0139d005c65f4f4e09564fe47d90859f18321cf57a268acabaf2019a818647



HD Wallet
==================
Mnemonic:      office able fish what reduce play best elder alarm eyebrow cool couch
Base HD Path:  m/44'/60'/0'/0/{account_index}



Default Gas Price
==================
20
