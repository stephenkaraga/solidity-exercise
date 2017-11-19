pragma solidity ^0.4.18;

contract SimpleDapp {
    uint someVar;
    
    function setSomeVar(uint myVar) public {
        someVar = myVar;
    }
    
    function getSomeVar() public constant returns (uint) {
        return someVar;
    }
    
    function setSomeVarTimesFour(uint myVar) public {
        setSomeVar(4 * myVar);
    }
}

contract SomeOtherSimpleDapp {
    SimpleDapp simpleDapp;
    SimpleDapp newInstanceOfSimpleDapp;
 
   function SomeOtherSimpleDapp(address whereIsMyOtherContract) public {
        simpleDapp = SimpleDapp(whereIsMyOtherContract);
        newInstanceOfSimpleDapp = new SimpleDapp();
    }
    
    function getSimpleDappSomeVar() public constant returns (uint) {
        return simpleDapp.getSomeVar();
    }
    
    function getNewInstanceOfSimpleDappSomeVar() public constant returns (uint) {
        return newInstanceOfSimpleDapp.getSomeVar();
    }
}

contract SomeContract {
    uint someVar;
    
    function getMyVar() public constant returns (string, uint) {
        if (someVar > 2) {
            return ("greater than two", someVar);
        } else if (someVar == 2) {
            return ("is exactly 2", someVar);
        } else {
            return ("it is smaller than 2", someVar);
        }
    }
}
