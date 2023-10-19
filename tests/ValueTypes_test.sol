// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../1-datatypes/ValueTypes.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuiteValueTypes {

    ValueTypes vt_contract;

    function beforeAll() public {
        vt_contract = new ValueTypes();
    }

    function checkBool() public {
        Assert.equal(vt_contract.mybool(), true, 'mybool should be true');
    }

    function checkAddr() public {
        Assert.equal(vt_contract.myaddr(), address(vt_contract), 'myaddr should have the value of the deployed contract');
    }

    function checkNum() public {
        Assert.equal(vt_contract.mynum(), 1830, 'should be true');
    }
}
    