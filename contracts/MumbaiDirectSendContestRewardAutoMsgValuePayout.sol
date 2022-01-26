// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract ContestRewardAutoMsgValuePayout { 

    address[] teamAddresses = [0x66C1d8A5ee726b545576A75380391835F8AAA43c]; 
    //receive() auto executes when getting ether like fallback(). Don't need fallback() because we don't need proxy/upgrades.
    receive() external payable {  
        if(address(this).balance >= (teamAddresses.length)*(10**18)) { //Execute only if we can pay 1 ETH to each member.
            for(uint i = 0; i < teamAddresses.length; i++) {
                payable(teamAddresses[i]).transfer(address(this).balance/((teamAddresses.length)-i)); //Even transfer.
            }
        }
    }

}
