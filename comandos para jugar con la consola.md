# Comandos para interactuar con el contrato

## Obtener cuentas en la red (en el nodo)
const accounts = await web3.eth.getAccounts()

web3.eth.getBlockNumber()
instance.sendCoin(accounts[1], 10, {from: accounts[0]})

web3.eth.getBalance(accounts[0])

#### tener en cuenta en una estructura interna se debe poner al parecer todo en comillas
- personaDao.guardar(accounts[1], ["pipe", "felipe", "primerApellido","segundoApellido","identificacion",["nombre", "descripcion", "true"], true])

# Comandos actualizados
### UsuarioVO (Al parecer los VO no requieren desplegarse)
UsuarioVO.new().then(c => usuarioVO=c)
UsuarioVO.at("0xE79dBBBf9F62b81C8C5bFde87ad38224e2C91F6A").then(c=> usuarioVO=c)
UsuarioVO.at(accounts[9]).then(c=> j=c)

usuarioVO.setDireccion(accounts[2])
usuarioVO.setRolId(0)
usuarioVO.setEstaActivo(true)
usuarioVO.getRol()
usuarioVO.getUsuarioVOValue()

usuarioVO.setDireccion(accounts[1])
usuarioVO.setRolId(1)
usuarioVO.setEstaActivo(true)

### UsuarioMapper
- UsuarioMapper.deployed().then(c => usuarioMapper=c)
- UsuarioMapper.at("0xfD36d95486f2AD968119202d2608aE8b81981D44").then(c => usuarioMapper=c)


- usuarioMapper.consultar(accounts[9])
- usuarioMapper.guardar(accounts[2], usuarioVO.address)

### PermisoRolMapper
- PermisoRolMapper.deployed().then(c => permisoRol=c)

- permisoRol.consultar(1,1)
- permisoRol.guardar(1, 1, true)
- permisoRol.guardar(0, 0, true)

### Acceso 
const accounts = await web3.eth.getAccounts()
- Acceso.deployed().then(c => acceso=c)

- acceso.setUsuarioMapper(usuarioMapper.address)
- acceso.setPermisoRolMapper(permisoRol.address)

- acceso.login({from: accounts[0]}) 
- acceso.login.call({from: accounts[0]})

- acceso.usuarioEsMedico.call(accounts[9]) 
- acceso.usuarioEsPaciente.call(accounts[2]) 

- acceso.buscarPermisoDeRol.call(accounts[2],1) 

- acceso.validarPermisoDeRol.call(accounts[9],21)



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
PacienteVO.at("0xBA2e6d32b44FD7CE6fdEAcFE13cB6cf0C59629eb").then(c=> j=c)

require('./initial.js')
exec ./initial.js

truffle exec ./initial.js

### Paciente
- Paciente.deployed().then(c => paciente=c)

- paciente.setPacienteMapper(pacienteMapper.address)
- paciente.setRolMapper(rolMapper.address)
- paciente.setUsuarioMapper(usuarioMapper.address)
- paciente.setAcceso(acceso.address)

- paciente.consultar(accounts[2],{from: accounts[2]})
- paciente.consultar({from: accounts[2]})
paciente.consultar(accounts[0], { from: accounts[2] })
- paciente.registrarConStruct(accounts[4], values, {from: accounts[4] })

- paciente.registrarConStruct(accounts[4], [[accounts[4], "Andres","struct", "Gomas", "test", "111111",0, "true"],[0, 0, 0, 25, "Bogota", "ocupacion","direccion","3150 000",0,0,0], 0], { from: accounts[4] })

### Médico
- Medico.deployed().then(c => medico=c)
- medico.consultar(accounts[9], { from: accounts[8] })
- medico.registrarConStruct(accounts[9], [[accounts[9], 0, "Andres","medico", "Gomas", "test", "111111",0, "true"], 1,0], "usuario", "contrasena", { from: accounts[9] })

    

### RolMapper
- RolMapper.deployed().then(c =>rolMapper=c)
- rolMapper.consultar(0)
- rolMapper.guardar(0, rolVO.address)
rolMapper.guardar(rolVO.address)
- rolMapper.actualizar(1, rolVO.address)

### RolVO
RolVO.new().then(c => rolVO=c)
RolVO.at("0x5FbcD1602c8da56F6eDCb185CbdF560f6a5080BF").then(c => rolVO=c)
rolVO.setId(5)
rolVO.getId()
rolVO.setNombre("ganster")
rolVO.getPermisosSize()
rolVO.getPermiso(2)
rolVO.setPermiso(2, "0x9d9D6b97244ccD8dB22cc406048CfF35d6F59B12", true)


### PermisoMapper
PermisoMapper.deployed().then(c =>permisoMapper=c)

## TipoIdentificacionVO

TipoIdentificacionVO.new().then(c => tipoIdentificacionVO=c)
const accounts = await web3.eth.getAccounts()

## EstadoVO

EstadoVO.new().then(c => estadoVO=c)
EstadoVO.at("0x47fE2e4C66B235b523f17D2da214EA536Fd6B584").then(c=> estadoVO=c)
estadoVO.getNombre()
estadoVO.getId()
estadoVO.getNombre()
estadoVO.getNombre()

# DatosParametricosMapper

DatosParametricosMapper.new().then(c => datosParametricosMapper=c)
DatosParametricosMapper.deployed().then(c => datosParametricosMapper=c)

datosParametricosMapper.consultarTipoIdentificacionVO.call(0)
datosParametricosMapper.guardarTipoIdentificacionVO.call(tipoIdentificacionVO.address)

datosParametricosMapper.consultarEstadoVO(0)
datosParametricosMapper.guardarEstadoVO(estadoVO.address)

datosParametricosMapper.tipoIdentificacionAddressList
datosParametricosMapper.tipoIdentificacionAddressList.length

datosParametricosMapper.registros.call()

datosParametricosMapper.consultarTipoIdentificacionVO(0)


# Historia clínica
- const accounts = await web3.eth.getAccounts()
- HistoriaClinica.deployed().then(c => historiaClinica=c)

- historiaClinica.setHistoriaClinicaMapper(historiaClinicaMapper.address)
- historiaClinica.setDatosParametricosMapper(datosParametricosMapper.address)
- historiaClinica.inicializarHCE(accounts[8], {from: accounts[9]})
- historiaClinica.getHistoriaClinica.call(accounts[8], {from: accounts[9]})
- historiaClinica.registrosFiltradosPorFecha(accounts[0], 1)
- historiaClinica.agregarRegistro(accounts[8], alergia.address, {from: accounts[9]})
- historiaClinica.registrosFiltradosPorTipo(accounts[8], 0, {from: accounts[9]})

- historiaClinica.getAcceso()
- historiaClinica.tieneAccesoFunc(21, {from: accounts[9]})

# Alergia VO
- AlergiaVO.new().then(c => alergia=c)
- AlergiaVO.at('0xaAC7b1761026D3C4E223B18Fb1985097B6E52f18').then(c => alergia2=c)
- alergia2.getAlergiaStruct()
- alergia2.getCodPrestadorServicioDeSalud()
- alergia2.getFechaRegistro()
- alergia2.

web3.eth.getBlock(142).timestamp

# AccesoHistoriaClinicaMapper
const accounts = await web3.eth.getAccounts()
- AccesoHistoriaClinicaMapper.deployed().then(c => ahcm = c)
- ahcm.getPermisosDeAccesoPorHistoriaClinica(accounts[0])
- ahcm.getPermisosDeAccesoActivosPorHistoriaClinica(accounts[0])
- ahcm.getPermisosDeAccesoActivosPorMedico(accounts[1])
- ahcm.getPermisosDeAccesoPorMedico(accounts[1])
- ahcm.esPermisoVigente(accounts[0], accounts[1])
- ahcm.getPermisos(accounts[0], accounts[1])
- ahcm.setPermiso(accounts[0], accounts[1], permiso.address)
- ahcm.filtroPermisosDeAccesoActivos([ permiso.address ])
- ahcm.crearLlave(accounts[0], accounts[1])

# AccesoHistoriaClinica
- 0 paciente 1 médico
- AccesoHistoriaClinica.deployed().then(c => ahc = c)
- ahc.responderSolicitudDeAcceso(accounts[1], true, {from: accounts[0]})
- ahc.solicitarAccesoHistoriaClinica(accounts[0], {from: accounts[1]})
- ahc.esSolicitudVigente(accounts[0], accounts[1])
- ahc.getPermisosDeAccesoActivosPorHistoriaClinica(accounts[0])
- ahc.getPermisosDeAccesoPorHistoriaClinica(accounts[0])
- ahc.getPermisosDeAccesoActivosPorMedico(accounts[9], {from: accounts[9]})
- ahc.getPermisosDeAccesoPorMedico.call(accounts[9], {from: accounts[9]})

- ahc.esSolicitudVigente.call(accounts[8], accounts[9], {from: accounts[9]})
- ahc.setAccesoHistoriaClinicaMapper("0xdcc85D7139741266B58853341af6B62a0D3B8dd4")
- ahc.setAcceso("0xdcc85D7139741266B58853341af6B62a0D3B8dd4")
- ahc.getAcceso()
- ahc.tieneAccesoFunc(21)

# PermisoDeAccesoVO
- PermisoDeAccesoVO.new().then(c => permiso = c)
- PermisoDeAccesoVO.at('0x6201629101b14Df46d2DC10A06599332AB850Ea4').then(c => permiso = c)
- permiso.setFechaExpiracion(1663869864)
- permiso.getFechaExpiracion()
- permiso.getId()

# Oracle
- Oracle.deployed().then(c => oracle = c)
- oracle.createRequest("","")

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

# ganache 
ganache-cli  --logging.debug

# Ejecutar scripts
 truffle exec ./initial.js

#      truffle exec ./scripts/initial.js;
#      truffle exec ./scripts/usuariosDefault.js;


  ethereum_node:
    # image: node:alpine
    build: 
      context: ./back
      target: base
    container_name: ${NODE}    
    env_file: 
      - .env
    ports: 
      - 7545:7545
    networks:
      - backend
    command: sh -c "
      ganache-cli  -h 0.0.0.0 -p 7545 --chainId 1337 -g 0 -m ${MNEMONIC};"


  back:
    build: 
      context: ./back
      target: base
    depends_on:
      - ethereum_node
    container_name: ${API_NAME_BACK}
    volumes:
      - ../../back-hce:/back
      - ../../front-hce-2022-07:/front
    env_file: 
      - .env      
    working_dir: /back
    networks:
      - backend
    command: sh -c "
      echo ===========INICIANDO BACK-END===========;
      echo ${MNEMONIC}      
      sleep 8s;
      truffle migrate -f 3 --to 3;
      rm -r /front/src/assets/contracts;
      mkdir /back/build/contracts/extras;
      truffle exec ./scripts/initial.js;
      truffle exec ./scripts/usuariosDefault.js;
      cp -r -v /back/build/contracts /front/src/assets/contracts;"


  front:
    build: 
      context: ./front
      target: base    
    container_name: ${API_NAME_FRONT}
    depends_on:
      - back
    volumes:
      - ../../front-hce-2022-07:/front
    env_file: 
      - .env  
    working_dir: /front
    ports: 
      - 4200:4200
    networks:
      - backend
    command: sh -c "
      ls;
      npm install;
      sleep 30s;
      echo ===========INICIANDO FRONT-END===========;
      ng serve --host 0.0.0.0 --poll;"
  

  sistema-validador-externo:
    image: node:19-alpine
    container_name: ${API_NAME_VALIDADOR_EXTERNO}
    volumes:
      - ../../sistema-validacion-medico:/validador
    env_file: 
      - .env
    working_dir: /validador
    ports: 
      - 3001:3001
    networks:
      - backend
    command: sh -c "
      ls;
      npm install;
      sleep 15s;
      echo ===========INICIANDO VALIDADOR EXTERNO===========;
      npm start;"