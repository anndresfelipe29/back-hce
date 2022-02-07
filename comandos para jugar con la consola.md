# Comandos para interactuar con el contrato

## Obtener cuentas en la red (en el nodo)
const accounts = await web3.eth.getAccounts()

## Instanciar objetos de los contratos

AccesoService.deployed().then(c => accesoService=c)
MedicoService.deployed().then(c => medicoService=c)
PacienteService.deployed().then(c => pacienteService=c)



### PersonaDAO
- PersonaDAO.deployed().then(c => personaDao=c)

- personaDao.consultar(accounts[1])

#### tener en cuenta en una estructura interna se debe poner al parecer todo en comillas
- personaDao.guardar(accounts[1], ["pipe", "felipe", "primerApellido","segundoApellido","identificacion",["nombre", "descripcion", "true"], true])

## PacienteDAO
PacienteDAO.deployed().then(c => pacienteDao=c)
pacienteDao.consultar(accounts[2])
pacienteDao.guardar(accounts[2], ["estado", "datosPersonales", true])


### Persona
- Persona.deployed().then(c => persona=c)

- persona.setContratoPersonaDAOAddress('0x1fA113630905BDF594FA6470f17e35B122BEFca3',{from: accounts[0]})

- persona.consultar(accounts[1])

- persona.registrar(accounts[2], ["pipe", "felipe", "primerApellido","segundoApellido","identificacion",["nombre", "descripcion", "true"], true])

- persona.PersonaDAOAddress.call()

### Paciente
- Paciente.deployed().then(c => paciente=c)

- paciente.setContratoPersonaAddress('0x83795A61A2ec6414CAAb94bEc37304f0a950076f',{from: accounts[0]})

- paciente.setContratoPacienteDAOAddress('0x3b2A1b78ce08C77e8868F58bE0F5ED18A6663B3f',{from: accounts[0]})

- paciente.consultar(accounts[2])

- paciente.consultarPaciente(accounts[2])

- paciente.consultarPersona(accounts[2])

- paciente.registrar(accounts[2], ["estado", "datosPersonales", true])

- persona.PersonaDAOAddress.call()

### Paciente service
- PacienteService.deployed().then(c => pacienteService=c)

- pacienteService.setContratoAccesoService('0x7edcDDeD0a30F517047fB8F4142920A229aB41aB' ,{from: accounts[0]})

- pacienteService.setContratoPaciente('0x335a7044C75a05F0aD0e301e090E78a5Cc7ca402' ,{from: accounts[0]})

- pacienteService.selfDestruct({from: accounts[0]})

- pacienteService.consultar(accounts[1])

- pacienteService.allEvents()


### Acceso service
- AccesoService.deployed().then(c => acceso=c)

- acceso.setPersonaAddress('0x772D573714a0DF55b56386D4323B7464011DE802',{from: accounts[0]})

- acceso.login({from: accounts[1]})

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

Migraciones 
Parra correr una migracion específica
$ truffle migrate -f 1 --to 1
$ truffle migrate -f 5 --to 5

truffle migrate -f 3 --to 3 --reset  