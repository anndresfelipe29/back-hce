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
(0) 0xf3c38139b80d0d432c5b6417b4d3ddd9fe51230f33d4e31ea2398474765fcba5
(1) 0xdfea06ed1dc3ff02b5593cc44cf4c8269e28b8a0fd8e65c9b45a710bfa68c007
(2) 0x06c1017856b40c15dd92e3827e417d67dbd89ae9ed24945b7a4167b496506be8
(3) 0xd4a9c51f520d493a49a5b1913d19a6a6ebbae4714ea5932014c36e17f4eb5c20
(4) 0x3149e3ae7d910f116b26cd7412cfbebb11c13383f79685c00fd696a75a9b7223
(5) 0xe5244fa8326c6e171bcbce26d99e39bdf669cd04ae7ab8e4d35c36f2273e1d68
(6) 0x031d65c46492acd6abff43e7548c8f2a7cd031e447e736640b3ff13e61f0d7ca
(7) 0xdd91f9d0241092745ca2b85313e30c2998487790bd1cedc677aae7b5de659f57
(8) 0xf6fd32a4a3ec0f7285a7cc5e741507a8a4f42218447a7d52001ef967d4d09e9a
(9) 0x29ba748c7786af89f3085a9a2066dd0770dbd3ae3ba7da3f5c32b5b3111ee06d






(0) 0x8aad4ab916d7c8266377b25e7afc20da50aa76983c7456d576e3c626c914ef8c
(1) 0x31a1511dddb5fa99983c06c47c3f38ddb801c921fb8d6570299d75a1499af615
(2) 0x9758c7d77043ea480439bdb4750ca4ed227af571b8a7fa7377f278fd19ed7af6
(3) 0xc2a352e069f11ea57add4ac95200fc87ad0e27a5efde66a0685deccc1109c087
(4) 0x318a6b570d88b7f8326e0b2605270996fa64e3ba4916102b964967cbc0c7e0d9
(5) 0xb601db195059bd746399e9ba233a15d4a0311d760ba88b785b938bc63d98cf00
(6) 0x395692b38f31d1066247498a037aac63f9f9b53d7a0c7edc6b22828cd5890c4f
(7) 0x6bcc0561e7eaccedc6dc090abb8e385632550ff019dbf14a7423edf009ee83ba
(8) 0x9c86d4a592d5872a7f4c0f53529c5b94ad52272688eb4fbf712c2a76f5533e50
(9) 0x0ca94b4b9f25569792dab2bc56ad3608ee089f574c822f1fe55cd01ee871899e


HD Wallet
==================
Mnemonic:      option reward combine popular estate vapor thunder brick also champion hunt combine
Base HD Path:  m/44'/60'/0'/0/{account_index}

Default Gas Price
==================
20
