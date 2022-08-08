// const PersonaStruct = artifacts.require("PersonaStruct");
// const PacienteDAO = artifacts.require("PacienteDAO");
// const PacienteService = artifacts.require("PacienteService");
const PacienteMapper = artifacts.require("PacienteMapper");
const Paciente = artifacts.require("Paciente");
// const PacienteVO = artifacts.require("PacienteVO");
const MedicoMapper = artifacts.require("MedicoMapper");
const Medico = artifacts.require("Medico");
const Acceso = artifacts.require("Acceso");
// const PermisoRolMapper = artifacts.require("PermisoRolMapper");
const EstadoVO = artifacts.require("EstadoVO");
const UsuarioMapper = artifacts.require("UsuarioMapper");
const RolMapper = artifacts.require("RolMapper");
const TipoIdentificacionVO = artifacts.require('TipoIdentificacionVO');
const DatosParametricosMapper = artifacts.require('DatosParametricosMapper');
const MedicoOraculo = artifacts.require('MedicoOraculo')


module.exports = function (deployer) {
    // deployer.deploy(PersonaStruct);
    // deployer.deploy(PacienteService);
    deployer.deploy(PacienteMapper);
    deployer.deploy(MedicoMapper);
    deployer.deploy(UsuarioMapper);
    deployer.deploy(Acceso);
    // deployer.deploy(PacienteVO);
    deployer.deploy(Paciente);
    deployer.deploy(Medico);
    deployer.deploy(EstadoVO);
    deployer.deploy(RolMapper);
    deployer.deploy(TipoIdentificacionVO);
    deployer.deploy(DatosParametricosMapper);
    deployer.deploy(MedicoOraculo);
    // deployer.deploy(PermisoRolMapper);

};
