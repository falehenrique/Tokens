
pragma solidity 0.4.18;

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    //Total de tokens gerados
    function totalSupply() public constant returns (uint);
    //balanço da conta por endereço
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    //Retorna a quantidade de tokens aprovada pelo proprietário que pode ser transferido para uma conta
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    //realiza a transferência de tokens apartir de uma conta
    function transfer(address to, uint tokens) public returns (bool success);
    //libera o envio de uma quantidade x para uma conta
    function approve(address spender, uint tokens) public returns (bool success);
    //realiza a transferência de tokens entre contas
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
 
    //evento de transferência
    event Transfer(address indexed from, address indexed to, uint tokens);
    //evento de aprovação
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
 }

 