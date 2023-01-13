# Prototype of based-blockchain system software to store medical records

## System overview
In this project there is a prototype based-software system to manage electronic medical records according with Colombia laws in a descentralized environment and blockchain-based. The goal of this project is to provide a tool where people can manage its own medical history. In this tool they can see when, where and who is editying and who is seeing their medical data. In this project we found the backend-side of this prototype, to see the Frontend-side see **_Additional resources_**

## Team
- Andres Felipe Gomez Salinas (angomezs@correo.udistrital.edu.co)
- Jose Ricardo Ortega Ramirez (jrortegar@correo.udistrital.edu.co)

## Context Diagram
Potentially change
![Context](docs/images/context.png)

## Entry Points
* [![metamask](https://img.shields.io/badge/metamask-10.20.0-orange)](https://metamask.io/): A crypto wallet & gateway to blockchain apps.

## Technology stack
* [![solidity](https://img.shields.io/badge/solidity-0.8.17-brightgreen)](https://docs.soliditylang.org/en/v0.8.17/): is an object-oriented, high-level language for implementing smart contracts.
* [![ethereum](https://img.shields.io/badge/ethereum-gray)](https://ethereum.org/es/): is a community management technology that promotes Ether cryptocoin and thousands of decentralized applications.
* [![truffle](https://img.shields.io/badge/truffle-5.5.26-green)](https://trufflesuite.com/docs/truffle/): A world class development environment, testing framework and asset pipeline for blockchains using the Ethereum Virtual Machine (EVM), aiming to make life as a developer easier.
* [![ganache](https://img.shields.io/badge/ganache-7.4.0-yellow)](https://trufflesuite.com/docs/ganache/): A personal blockchain for rapid Ethereum and Corda distributed application development.
* [![node](https://img.shields.io/badge/node-16.17.0-yellowgreen)](https://nodejs.org/es/): an open-source, cross-platform JavaScript runtime environment.

## Project Structure
- [build/contracts](build/contracts/): The contracts compiled files in JSON format.
- [contracts/logica](contracts/logica/): Domain model of application
- [contracts/logica/IteradorHCE](contracts/logica/IteradorHCE/): Contains iterator over medical history
- [contracts/logica/sistemaExterno](contracts/logica/sistemaExterno/): Oraculo to create connection with External verification medical service
- [contracts/models](contracts/models/): 
- [contracts/models/accesoHistoriaClinica](contracts/models/accesoHistoriaClinica/): Access to medical history logic
- [contracts/models/historiaClinica](contracts/models/historiaClinica/): Medical records logic
- [contracts/models/historiaClinica/enums](contracts/models/historiaClinica/enums/): Contains enum file that classify the medical records
- [contracts/models/structsGenerales](contracts/models/structsGenerales/): Comun struct that can be contained in other structs
- [contracts/models/VOGenerales](contracts/models/VOGenerales/): Value objects of data entities.
- [contracts/persistence](contracts/persistence/): Contains mappers of domain model to be storage in blockchain
- [contracts/service](contracts/service/):
- [contracts/utils](contracts/utils/):

## How to Run
- In local environment
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

Reiniciar nonce 

https://blog.chronologic.network/how-to-change-and-reset-your-nonce-in-metamask-f7ca52f480e5

million benefit runway donor there gold cause ensure account decorate venture wonder

HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20

## Additional resources
- [Propose-frontend]()
=======
nodo_ganache     | Available Accounts
nodo_ganache     | ==================
nodo_ganache     | (0) 0x8765983E2557FbD93d2Cc9cAFD0f3a5C25441cd1 (100 ETH)
nodo_ganache     | (1) 0xe34B3beCf17BCDCDe971ccE1A11feE75a684ECdA (100 ETH)
nodo_ganache     | (2) 0x419D98F84F5B39Ab5bd8c164b8AB78A0B08FDa67 (100 ETH)
nodo_ganache     | (3) 0x9703e71BBb574482a010D4d3cA96EB1430F7BC29 (100 ETH)
nodo_ganache     | (4) 0xb00D8Eded7cC40288d296a1DC96466bEA3e8dF0C (100 ETH)
nodo_ganache     | (5) 0x321D2b901F89b0ea21bed966aaE297e8B1f42A91 (100 ETH)
nodo_ganache     | (6) 0x46d346A31c93F14f8E6B9F3a16cE34a910f2Be88 (100 ETH)
nodo_ganache     | (7) 0xBC0702F80DbB41187c63a70517b759fb79BF5c27 (100 ETH)
nodo_ganache     | (8) 0xBc24fBc830c43Cb34EF911309aAA1EB0Edb7C9Fb (100 ETH)
nodo_ganache     | (9) 0x9D80918B43Da28e504ecB349367dbbFDE4f402dD (100 ETH)
nodo_ganache     | 
nodo_ganache     | Private Keys
nodo_ganache     | ==================
nodo_ganache     | (0) 0x4e2cf3726f7311992a1602f36c9364cac9a35ffe0e943f152d54c14d3f58b6ca
nodo_ganache     | (1) 0x84722977a08dc79dfc426dc29339e6ec75baaf38ae2daced3eb1604c4ea20dbf
nodo_ganache     | (2) 0x765b3402bf3e4eff7ac3f44184f06c9f9eec87b0720d5510d2fee924bbd7ea6b
nodo_ganache     | (3) 0x7316cccfbc55a65ada0af4defe3db70b672732d7e40406afe1d76be65dfb76ba
nodo_ganache     | (4) 0xee5163742e2f54b541e486ca6830400a9e4afcb7f926435bb364cc9bf5099d11
nodo_ganache     | (5) 0x5773f1287cc5eedf0f7f4e0e0493406c62b0b0eb07070eb7c31a9d8a62e469e0
nodo_ganache     | (6) 0xd4e271eb312483e2007e242ac6c6dc98f0474c820c259b20ace7a0324c9374d3
nodo_ganache     | (7) 0x729aa618f7d70b7f0f8fc995a14b909bb2480fe2e0eeaa5403951876f764cb5e
nodo_ganache     | (8) 0xf68ba227fb42926a4e629408508a2b6da9036904fb3e59361d779b7686232e68
nodo_ganache     | (9) 0x5c6bb4d275828163cc7e5570d530c607e22c1fd15562adc96c6b080ef80139de
nodo_ganache     | 
nodo_ganache     | HD Wallet
nodo_ganache     | ==================
nodo_ganache     | Mnemonic:      sstereo
nodo_ganache     | Base HD Path:  m/44'/60'/0'/0/{account_index}
nodo_ganache     | 
nodo_ganache     | Gas Limit
nodo_ganache     | ==================
nodo_ganache     | 6721975
nodo_ganache     | 
nodo_ganache     | Call Gas Limit
nodo_ganache     | ==================
nodo_ganache     | 9007199254740991
