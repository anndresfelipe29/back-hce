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
(0) 0xdd81776ca106df5a0490b88adfa1da8b4b7e0b45c104943538fec8e15b9b6db0
(1) 0x6e751f789f503952d3bf2bacbeabbcd1318490226b8a7b683b27d0cef45d1dee
(2) 0x46628cff6a0789faae8561fa886eabdfc93646f4e6c7dbce9e0969751df60ca4
(3) 0x7ae5d7d980662326ff2390390b0052525580e9eb3a02883b27468fa7dbc8a9ae
(4) 0x42a48d4ed3946aef2cd345f47b0e731f0091dd1dc154440352c3d2ff3656db0a
(5) 0x4fb45ab6e8143d5c6d73225ea5d585de9a7ac7de1dc542aa5b4abcad43f08915
(6) 0x3e383e3333f5ed1309411195bde49dfc73d096c88c4e37ff7648faf17704a7e2
(7) 0xa50355320691ef76241f2c044f09aa457a90f4e49379001d76d29ddca65403d3
(8) 0x058c7c4994b5acfa5eea23e4002fcfb4db67012416c1f7fbc3fe460e63642a4e
(9) 0x45211b9b06ce9e6d6eb31ceef3b71f59ad6f63576a75666f6de5328faeaa4d7f