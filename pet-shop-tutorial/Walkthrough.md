//Compile and migrate contracts
truffle compile

truffle develop
migrate --reset

Adoption.at("<contract address>").adopt(0);
Adoption.at("<contract address>").adopt(1);
Adoption.at("<contract address>").adopt(10);
Adoption.at("<contract address>").getAdopters();


//Add new method
    uint public value;

    function add(uint a, uint b) public returns (uint) {
        value = a + b;
        return value;
    }

    function isValidValue() public returns (bool) {
        if (value <= 10) {
            return true;
        } else {
            return false;
        }
    }    

compile
migrate --reset

Adoption.at("<contract address>").add(20, 59);
Adoption.at("<contract address>").value.call();
