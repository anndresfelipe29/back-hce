# Comandos para interactuar con el contrato

## Obtener cuentas en la red (en el nodo)
const accounts = await web3.eth.getAccounts()

## Instanciar objetos de los contratos

AccesoService.deployed().then(c => accesoService=c)
MedicoService.deployed().then(c => medicoService=c)
PacienteService.deployed().then(c => pacienteService=c)

### Paciente service
pacienteService.consultar(accounts[1])
pacienteService.allEvents()

### PersonaDAO
PersonaDAO.deployed().then(c => personaDao=c)
personaDao.consultar(accounts[1])
personaDao.guardar(accounts[1], ["primerN", "segundoNombre", "g","g","g","g", true])

personaDao.guardar(accounts[1], ["pipe", "felipe", "primerApellido","segundoApellido","identificacion",{"nombre", "descripcion", true}, true])

### tener en cuenta en una estructura interna se debe poner al parecer todo en comillas
personaDao.guardar(accounts[1], ["pipe", "felipe", "primerApellido","segundoApellido","identificacion",["nombre", "descripcion", "true"], true])




### Persona
- Persona.deployed().then(c => persona=c)

- persona.consultar(accounts[1])

- persona.registrar(accounts[2], ["pipe", "felipe", "primerApellido","segundoApellido","identificacion",["nombre", "descripcion", "true"], true])

- persona.setPersonaDAOAddress('0xEf1E6643162E2D9254E3804aE8f861Eb0B7bDd8b',{from: accounts[0]})

- persona.PersonaDAOAddress.call()

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