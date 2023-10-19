// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../3-functions/PayableUniModule.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {

    PayableUniModule uniModule;
    uint256 price = 100;

    function beforeAll() public {
        uniModule = new PayableUniModule(price);
    }

    function checkModuleLeader() public  {
        Assert.equal(uniModule.moduleLeader(), address(this),  "moduleLeader is incorect");
    }

    function checkRegisterWithoutPaymentFails () public  {
        try uniModule.register("Antreas", "0000000") returns (bool) {
            Assert.ok(false, "register should fail if payment is invalid");
        } catch  {
            Assert.ok(true, "register should fail if payment is invalid");
        } 
    }

    /// #value: 100
    function checkRegisterWithPaymentSucceeds () public payable  {
        uniModule.register{value: msg.value}("Antreas", "0000000"); 
        (string memory name, string memory studentId, uint256 grade) = uniModule.studentRegistry(address(this));
        Assert.equal(keccak256(abi.encodePacked(name)), keccak256(abi.encodePacked("Antreas")),  "register function should assign the name correctly");
        Assert.equal(keccak256(abi.encodePacked(studentId)), keccak256(abi.encodePacked("0000000")),  "register function should assign the studentID correctly");
        Assert.equal(grade, 0,  "register function should assign grade to 0");
    }

    /// #value: 100
    function checkSetModuleRepRegistered() public payable{
        uniModule.register{value: msg.value}("Georgios", "0000001");
        uniModule.setModuleRep(address(this));
        
        Assert.equal(uniModule.moduleRep(), address(this),  "moduleRep is incorect");
    }

    /// #value: 100
    function checkSetModuleRepNotRegistered() public payable{
        uniModule.register{value: msg.value}("Georgios", "0000001");
        try uniModule.setModuleRep(address(0xFFfFfFffFFfffFFfFFfFFFFFffFFFffffFfFFFfF)) returns (bool) {
            Assert.ok(false, "setModuleRep should fail if student is not registered");
        } catch  {
            Assert.ok(true, "setModuleRep should fail if student is not registered");
        } 
    }

}
    