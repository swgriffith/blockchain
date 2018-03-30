pragma solidity ^0.4.17;


import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";


contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    //Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint returnedID = adoption.adopt(8);

        uint expected = 8;

        Assert.equal(returnedID, expected, "Adoption of pet ID 8 should be recorded.");
    }

    //TEsting Retrieval of single pet's owner
    function testGetAdopterAddressByPetId() public {
        //Expected owner is this contract
        address expected = this;

        address adopter = adoption.adopters(8);

        Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");

    }

    //Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
        //Expected owner is this contract
        address expected = this;

        //Store addopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");

    }


}
