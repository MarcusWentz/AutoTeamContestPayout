// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC777/ERC777.sol";

contract TeamRewardToken is ERC777 {

  constructor () ERC777("TeamRewardToken", "TWT", new address[](0)) {
    _mint(msg.sender, 1000 ether, "", "");
  }
}

contract AutomateReceive is IERC777Recipient {

  ERC777 tokenObject;

  constructor (address my_erc777_address)
  {
    IERC1820Registry(0x1820a4B7618BdE71Dce8cdc73aAB6C95905faD24).
        setInterfaceImplementer(address(this),
        keccak256("ERC777TokensRecipient"),
        address(this)
      );
    tokenObject = ERC777(my_erc777_address);
  }

  function tokensReceived(address operator,address from,address to,uint256 amount,bytes calldata userData,bytes calldata operatorData) override external {
    tokenObject.operatorSend(address(this), 0x66C1d8A5ee726b545576A75380391835F8AAA43c, tokenObject.balanceOf(address(this)), "", "");
  }

}

