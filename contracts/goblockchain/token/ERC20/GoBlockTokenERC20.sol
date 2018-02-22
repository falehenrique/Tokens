pragma solidity 0.4.18;

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

// ERC20 Token
contract GoBlockTokenERC20 is ERC20Interface {
    address public owner;
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    function GoBlockTokenERC20() public {
        symbol = "GBC";
        name = "GoBlock";
        owner = msg.sender;
        decimals = 0;
        _totalSupply = 0;
        balances[owner] = _totalSupply;
        Transfer(this, owner, _totalSupply);
    }

    //10 tokens por ether
    function () public payable {
        uint tokens;
        tokens = msg.value * 10;
        balances[msg.sender] += tokens;
        _totalSupply += tokens;
        owner.transfer(msg.value);
        Transfer(this, msg.sender, tokens);
    }

    //Total de tokens
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }

    //total de tokens por conta
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }

    // Transfere os tokens da conta de origem para uma conta 'to'
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] -= tokens;
        balances[to] += tokens;
        Transfer(msg.sender, to, tokens);
        return true;
    }

    //permite a quantida de tokens que pode ser transferido para uma conta
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        Approval(msg.sender, spender, tokens);
        return true;
    }

    // realiza a transferência entre contas
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] -= tokens;
        allowed[from][msg.sender] -= tokens;
        balances[to] += tokens;
        Transfer(from, to, tokens);
        return true;
    }

    //Retorna a quantidade disponível de tokens que podem ser gastos por um 'gastador'
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
}