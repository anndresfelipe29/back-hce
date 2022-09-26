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
(0) 0xf2869ff7b16049b663531d20bddb1b0d4a395b4aed44422533a945e7944f5c91
(1) 0x6a0244d06c8d4d383818f1ca7c358d01118a6ab2f374167b026749a1416578c2
(2) 0xfb7c56811473b3ff8c49bb767f470a0c5d35139801ae9cab1c3430dd80ab4d27
(3) 0xfb25d1904d003dc57b351c8fe6b54f7faa07987f8e08d7dfc197355fe8306bf0
(4) 0x670314d75ec47cdedf6ea66fdb6ffe599520ad4aa672cd6ee51ca1c4c8f42884
(5) 0x891d9b9827a1008ff528e740cd8b880db5aa79a81460b56f1efc098306e364ca
(6) 0xdf35c0607e2df2a61752e6c4c0e559c236ed46f497449d29986362c72cc518ca
(7) 0x6f3c9f9b57c7d6f6c9a71dd62a9a723e7644d37b66aa34af2f1073b1d5f1f12f
(8) 0x99a8879f48009e732d0e5a5c3a641b38bb1901577396ac128ff146907e19e2b3
(9) 0x962dd0db5c21217da0750be081b617e48fb2f371622d0373e048fbc8d657456e

HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
