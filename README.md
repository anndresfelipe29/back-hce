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
(0) 0xd9f4a575b348f43c4e88758f8fdd562e4964e94f2a734be46f4c60c93da18a08
(1) 0xa829c197f16fd682de2c6fd3ca54c3b744d192d3ea926ae7f11241b1940813d9
(2) 0xc54bc0ca004fd8230299f3db61afac04abedb75cb026df62647f06153759b6a4
(3) 0x901e1b5bc947debcf4d9fd3f138235cdc72db824bdf20786f12faa40017b4ba9
(4) 0x6c263e25ab2280f4bbad3afbc4502d2e309b4d0aa40f08a1ba9378f6637ee104
(5) 0xd51d5fe6d320bbfc4ee60d40eaf07ec1aee61b518e182edccb090f8d7a9857bf
(6) 0xba069999a33f95b4b94fd2f174566d1659a555262e38c02f7220265d55e9f76b
(7) 0x86155f7d25f7cd0a0941e6ea20ec10314c1dfa85143406528cabd5f67b0a7b90
(8) 0xcbf5ea056f88df7658f7c86ba24162f31632805dec102354802eeb7dd10c3b19
(9) 0x0a6e2d6d06ee7ab24aa5ce6b51dd4d30b452c05456e1b462631694c9400e1112

HD Wallet
==================
Mnemonic:      nest mercy pudding cost lunch time lady void glance treat sentence follow
Base HD Path:  m/44'/60'/0'/0/{account_index}


Default Gas Price
==================
20
