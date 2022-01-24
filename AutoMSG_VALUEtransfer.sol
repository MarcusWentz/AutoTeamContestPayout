// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract ContestRewardAutoMsgValuePayout { 

    address[] teamAddresses = [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, //All 4 team members listed here. 
                               0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,
                               0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db,
                               0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB]; 
    //receive() auto executes when getting ether like fallback(). Don't need fallback() because we don't need proxy/upgrades.
    receive() external payable {  
        if(address(this).balance >= 4 ether) { //Only execute if we have at least 4 ETHER
            for(uint i = 0; i < teamAddresses.length; i++) {
                payable(teamAddresses[i]).transfer(1 ether);
            }
        }
    }

}
