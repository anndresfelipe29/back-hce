pragma solidity ^0.8.17;

import "../../models/historiaClinica/RegistroMedico.sol";
abstract contract RegistroMedicoIterator {
    function getNext() virtual public returns(RegistroMedico);
    function hasMore() virtual public returns(bool);
}