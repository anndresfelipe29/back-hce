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
(0) 0x58e920f81e652cc2b55a60234e7c25f64f5231b993b1d466243c14b2a019d8ec
(1) 0xcdbf840eddcfab64b2d96874e9a9380d7f94de2b66784e80d55481ad3b70b02e
(2) 0xb9811af015f1735fc5bd86e9e4017591b0329bf6338ef181178e4b56fad1a118
(3) 0xf6949b8702f24b054113a4a190d47fdc43f65a22f661fd51b639f2915cbfee6c
(4) 0xa0adfddf946b9c5b576e7c11611c4ca01d407fe80fa521b31e0f0c18c44de188
(5) 0x3286541c9c1ef48aa0a72aaa9865cf1a005dc25c861512bbf8e3b328a262a6d2
(6) 0xbe57a1c30d8f6c3bc6487a4a17559e8259184bf46abd9684b34f286c62a4b8fc
(7) 0xce4768bdff1ca6588eb9b364b7abc191ee90937de7b013328958dadc7b98e1e6
(8) 0x70db2bbe83a8326c7920128718b186c4e995b8770e28755451055fd4a0fac70e
(9) 0x76c509a8f5abda5e69ce8fb46a34deea6e3efeeaec12963a56a457032f182977

HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
