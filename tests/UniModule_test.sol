// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../2-constructor/UniModule.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuiteUniModule {

    UniModule uniModule;

    function beforeAll() public {
        uniModule = new UniModule(address(0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF));
    }

    function checkUniModule() public {
        // Use 'Assert' methods: https://remix-ide.readthedocs.io/en/latest/assert_library.html
        Assert.equal(uniModule.moduleRep(), address(0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF),  "moduleRep is incorect");
        Assert.equal(uniModule.moduleLeader(), address(this),  "moduleLeader is incorect");
    }

}
    