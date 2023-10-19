// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../1-datatypes/ReferenceTypes.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuiteReferenceTypes {

    ReferenceTypes rt_contract;

    function beforeAll() public {
        rt_contract = new ReferenceTypes();
    }

    function checkClass() public {
        // Use 'Assert' methods: https://remix-ide.readthedocs.io/en/latest/assert_library.html
        (string memory name, uint256 grade) = rt_contract.class(9);
        Assert.ok(grade == 0, 'Class of length 10 should exist');
        Assert.ok(keccak256(abi.encodePacked(name)) == keccak256(abi.encodePacked("")), 'Class should exist');

        try rt_contract.class(10) returns (string memory , uint256) {
            Assert.ok(false, "Class should be of size 10");
        } catch  {
            Assert.ok(true, "Class should be of size 10");
        } 
    }

    function checkStudentRegistry() public {
        // Use 'Assert' methods: https://remix-ide.readthedocs.io/en/latest/assert_library.html
        (string memory name, uint256 grade) = rt_contract.studentRegistry(address(this));
        Assert.ok(grade == 0, 'Strudent registry with grade should exist');
        Assert.ok(keccak256(abi.encodePacked(name)) == keccak256(abi.encodePacked("")), 'Student registry with name exist');
    }
}
    