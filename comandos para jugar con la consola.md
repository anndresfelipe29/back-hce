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

### Acceso service
- AccesoService.deployed().then(c => acceso=c)

- acceso.setContratoPersonaAddress('0x1b66Fb1b2ED7A3eaDC47df1DCDcEb02a25949603',{from: accounts[0]})

- acceso.login({from: accounts[1]})
- acceso.consultarRol(accounts[5], {from: accounts[2]})

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