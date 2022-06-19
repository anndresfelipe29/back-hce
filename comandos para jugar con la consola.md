# Comandos para interactuar con el contrato

## Obtener cuentas en la red (en el nodo)
const accounts = await web3.eth.getAccounts()

web3.eth.getBlockNumber()
instance.sendCoin(accounts[1], 10, {from: accounts[0]})

web3.eth.getBalance(accounts[0])

## Instanciar objetos de los contratos

AccesoService.deployed().then(c => accesoService=c)
MedicoService.deployed().then(c => medicoService=c)
PacienteService.deployed().then(c => pacienteService=c)



### PersonaDAO  (ya no se usa)
- PersonaDAO.deployed().then(c => personaDao=c)

- personaDao.consultar(accounts[1])


#### tener en cuenta en una estructura interna se debe poner al parecer todo en comillas
- personaDao.guardar(accounts[1], ["pipe", "felipe", "primerApellido","segundoApellido","identificacion",["nombre", "descripcion", "true"], true])


### PersonaRepository (ya no se usa)
- PersonaRepository.deployed().then(c => persona=c)

- persona.consultar(accounts[1])

- persona.guardar(accounts[1], personaVo.address)
- personaVo.isValue.call()

### PersonaVO (ya no se usa)
PersonaVO.deployed().then(c => personaVo=c)
personaVo.setPrimerNombre("Felipe")
personaVo.setSegundoNombre("pruebita")
personaVo.setIsValue(true)
personaVo.getPrimerNombre()
personaVo.getIsValue()

## PacienteDAO
PacienteDAO.deployed().then(c => pacienteDao=c)
pacienteDao.consultar(accounts[2])
pacienteDao.guardar(accounts[2], ["estado", "datosPersonales", true])


### Persona
- Persona.deployed().then(c => persona=c)

- persona.setContratoPersonaDAOAddress('0xa0c8D1705Fe1bc91e4Dcac2F75F773890192005F',{from: accounts[0]})

- persona.consultar(accounts[1])

- persona.registrar(accounts[2], ["pipe", "felipe", "primerApellido","segundoApellido","identificacion",["nombre", "descripcion", "true"],2 , true])

persona.registrar(accounts[5], ["medico", "felipe", "primerApellido","segundoApellido","identificacion",["nombre", "descripcion", "true"],1 , true])

- persona.PersonaDAOAddress.call()

### Paciente
- Paciente.deployed().then(c => paciente=c)

- paciente.setContratoPersonaAddress('0x1b66Fb1b2ED7A3eaDC47df1DCDcEb02a25949603',{from: accounts[0]})

- paciente.setContratoPacienteDAOAddress('0xD88770c0591a9EB4EccDdd964702FFF5989f1041',{from: accounts[0]})

- paciente.consultar(accounts[2])

- paciente.consultarPaciente(accounts[2])

- paciente.consultarPersona(accounts[2])

- paciente.registrar(accounts[2], ["estado", "datosPersonales", true])

- persona.PersonaDAOAddress.call()

### Paciente service
- PacienteService.deployed().then(c => pacienteService=c)

- pacienteService.setContratoAccesoService('0xA48De5150840B7Ec867e6Fe4AEB370708E7f732C' ,{from: accounts[0]})

- pacienteService.setContratoPaciente('0xd9eED7a547E8d1F91420448792165034A04A5137' ,{from: accounts[0]})

- pacienteService.selfDestruct({from: accounts[0]})

- pacienteService.consultar(accounts[2],{from: accounts[5]})

- pacienteService.registrar([["pipe", "felipe", "primerApellido","segundoApellido","identificacion",["nombre", "descripcion", "true"],2 , true], ["estado", "datosPersonales", "true"]],{from: accounts[6]})

- pacienteService.allEvents()

[
    [
        "paciente", 
        "felipe", 
        "primerApellidoUser3",
        "segundoApellido",
        "identificacion",
    [
        "nombre", 
        "descripcion", 
        "true"
    ],
    2 ,
    true
    ], 
    [
        "estado", 
        "datosPersonales", 
        "true"
        ] 
]

# Comandos actualizados
### PacienteVO (Al parecer los VO no requieren desplegarse)
UsuarioVO.new().then(c => usuarioVO=c)
UsuarioVO.at("0xE262A13960fa754cC79cFF1176Ce466F9682a8Ef").then(c=> j=c)

usuarioVO.setDireccion(accounts[2])
usuarioVO.setRolId(0)
usuarioVO.setEstaActivo(true)
usuarioVO.getRolId()

usuarioVO.setDireccion(accounts[1])
usuarioVO.setRolId(1)
usuarioVO.setEstaActivo(true)

### UsuarioMapper
- UsuarioMapper.deployed().then(c => usuarioMapper=c)
- UsuarioMapper.at("0xfD36d95486f2AD968119202d2608aE8b81981D44").then(c => usuarioMapper=c)


- usuarioMapper.consultar(accounts[2])
- usuarioMapper.guardar(accounts[2], usuarioVO.address)

### PermisoRolMapper
- PermisoRolMapper.deployed().then(c => permisoRol=c)

- permisoRol.consultar(1,1)
- permisoRol.guardar(1, 1, true)
- permisoRol.guardar(0, 0, true)


### Acceso 
- Acceso.deployed().then(c => acceso=c)

- acceso.setUsuarioMapper(usuarioMapper.address)
- acceso.setPermisoRolMapper(permisoRol.address)

- acceso.login({from: accounts[2]}) 
- acceso.login.call({from: accounts[2]})

- acceso.usuarioEsMedico.call(accounts[2]) 
- acceso.usuarioEsPaciente.call(accounts[2]) 

- acceso.buscarPermisoDeRol.call(accounts[2],1) 

## PacienteMapper
- PacienteMapper.deployed().then(c => pacienteMapper=c)
- pacienteMapper.consultar(accounts[2])
- pacienteMapper.guardar(accounts[2], pacienteVO.address)
- personaVo.isValue.call()

### PacienteVO (Al parecer los VO no requieren desplegarse)
PacienteVO.new().then(c => pacienteVO=c)

pacienteVO.setPrimerNombre("Felipe")
pacienteVO.setSegundoNombre("pruebita")
pacienteVO.setIsValue(true)
pacienteVO.getPrimerNombre()
pacienteVO.getIsValue()

PacienteVO.deployed().then(c => pacienteVO=c)
pacienteVO.address
PacienteVO.at("0xC1aae6fc90CC58861A6777da0bd4117b081666a9").then(c=> j=c)


### Paciente
- Paciente.deployed().then(c => paciente=c)

- paciente.setPacienteMapper(pacienteMapper.address)
- paciente.setAcceso(acceso.address)

- paciente.consultar(accounts[2],{from: accounts[5]})


### RolMapper
- RolMapper.deployed().then(c =>rolMapper=c)
- rolMapper.consultar(0)
- rolMapper.guardar(0, rolVO.address)

### RolVO
RolVO.new().then(c => rolVO=c)
rolVO.setId(0)
rolVO.setNombre("ganster")
rolVO.getPermisosSize()

### PermisoMapper
PermisoMapper.deployed().then(c =>permisoMapper=c)








## Truffle Debug
- Para iniciar el debug usar
 truffle debug (+id de transaccion)  
 
- se logra ver el paso a paso con "o"
- Para imprimir una variable con "v"
Commands:
(enter) last command entered (step next)
(o) step over, (i) step into, (u) step out, (n) step next
(c) continue until breakpoint, (Y) reset & continue to previous error
(y) (if at end) reset & continue to final error
(;) step instruction (include number to step multiple)
(g) turn on generated sources, (G) turn off generated sources except via `;`
(p) print instruction & state (`p [mem|cal|sto]*`; see docs for more)
(l) print additional source context (`l [+<lines-ahead>] [-<lines-back>]`)
(s) print stacktrace, (h) print this help
(q) quit, (r) reset, (t) load new transaction, (T) unload transaction
(b) add breakpoint (`b [[<source-file>:]<line-number>]`; see docs for more)
(B) remove breakpoint (similar to adding, or `B all` to remove all)
(+) add watch expression (`+:<expr>`), (-) remove watch expression (-:<expr>)
(?) list existing watch expressions and breakpoints
(v) print variables and values (`v [bui|glo|con|loc]*`)
(:) evaluate expression - see `v`


Test

ejecutar test 
truffle test ./test/PersonaDAO.test.js --show-events 
truffle test ./test/PacienteMapper.test.js --show-events
truffle test ./test/MedicoMapper.test.js --show-events


Migraciones 
Parra correr una migracion específica
$ truffle migrate -f 1 --to 1
$ truffle migrate -f 5 --to 5

truffle migrate -f 3 --to 3 --reset  

instancia especifica
let specificInstance = await MetaCoin.at("0x1234...");
await PersonaVO.at("0x934F8fe5625207274A5fE8F17fD0E26b1A960745")
PersonaVO.at("0xf3400fa1a4C4C71b743512404Ce6a88BC61eFdCd").then(c=> j=c)
persona.consultar.call(accounts[1])



# Correr ganache-cli 

ganache-cli  --chain.allowUnlimitedContractSize --logging.debug  --database.dbPath /home/felipe/Documentos/Blockchain/codigo/ganache/data --miner.defaultGasPrice 1 --mnemonic "ten snow frozen rough palace sudden depart basic regret garment coconut cat" --defaultBalanceEther 9000000000000000000000

# Este si funciona
ganache-cli  --logging.debug --mnemonic "ten snow frozen rough palace sudden depart basic regret garment coconut cat" --database.dbPath /home/felipe/Documentos/Blockchain/codigo/ganache/data


ganache-cli  --logging.debug