pragma solidity 0.4.18;

library Util {
    //assemble verifica o endereço bytecode.
    function isContract(address _addr) internal view returns (bool) {
        uint length;
        assembly {
            //Retorna o codigo de uma conta
            length := extcodesize(_addr)
        }
        return (length>0);
    }
}