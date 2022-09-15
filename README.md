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
(0) 0x89047be2aa680f0e06935f19c47b70170ecc08f7c94a0aae7d76b18405398d4f
(1) 0x01502f648f138fa568863bbf548746f0b78de0cb14b020115be9425ce30eea5e
(2) 0x6b242313e7fae8a4b4859134e7708c2809107e36cf6a443dfe9d1649b4fb4c5e
(3) 0xcbe69380c5a9979452d619971a91c94d2d5cae3b78ba8ac8c3344b819d146594
(4) 0x3a3eada3c3b20ed35efea29c361c9d704b8ac017b9cc18a9b007530b216ed703
(5) 0xc5d6f8ae17082795787c2d6da8adcb0aadc71c1a3c42fe1465f4983242998f45
(6) 0xeb04c3090404b03b506452903e94037396073f373c0723554b4ef82047fdcce7
(7) 0x06e6a97674b82a4f9a590055af9dc07c7feccd19262bb3c4128f06ec97289b76
(8) 0x068e80bb117d815821c6202b1f8bc2575c3c95d378ae8bba0d3d7c81c1a5660b
(9) 0x6d33abbccff5d5879970534db1793f22c06f500db0c76dbbfbd6ec83c0b867d2

HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
