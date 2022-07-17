// const PersonaStruct = artifacts.require("PersonaStruct");
// const PacienteDAO = artifacts.require("PacienteDAO");
// const PacienteService = artifacts.require("PacienteService");
const PacienteMapper = artifacts.require("PacienteMapper");
const MedicoMapper = artifacts.require("PacienteMapper");
const Acceso = artifacts.require("Acceso");
// const PacienteVO = artifacts.require("PacienteVO");
const Paciente = artifacts.require("Paciente");
const Medico = artifacts.require("Medico");
// const PermisoRolMapper = artifacts.require("PermisoRolMapper");
const EstadoVO = artifacts.require("EstadoVO");
const UsuarioMapper = artifacts.require("UsuarioMapper");
const RolMapper = artifacts.require("RolMapper");
const TipoIdentificacionVO = artifacts.require('TipoIdentificacionVO');


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
    // deployer.deploy(PermisoRolMapper);

};
