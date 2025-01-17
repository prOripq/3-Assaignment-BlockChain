// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract Aitu_SE2315_YussupovZhangir is ERC20, ERC20Permit {
    constructor()
        ERC20("Aitu_SE2315_YussupovZhangir", "MTK")
        ERC20Permit("Aitu_SE2315_YussupovZhangir") payable 
    {
        _mint(msg.sender, 2000 * 10 ** decimals());
    }


    // Function to get the sender's address of the transaction
    function getTransactionSender() public view returns (address) {
        return msg.sender;
    }

    // Function to get the receiver's address (a given address)
    function getTransactionReceiver(address _to) public pure returns (address) {
        return _to;
    }

    // Function to get the timestamp of the latest transaction in a human-readable format
    function getLatestTransactionTimestamp() public view returns (string memory) {
        uint blockTimestamp = block.timestamp;
        return convertTimestampToDate(blockTimestamp);
    }

    // Helper function to convert timestamp to a human-readable format (e.g., years, months, days)
    function convertTimestampToDate(uint timestamp) public pure returns (string memory) {
        uint totalDays = timestamp / 86400; // Number of days since epoch
        uint TotalYears = totalDays / 365; // Approximate number of years
        uint months = (totalDays % 365) / 30; // Approximate number of months
        uint daysLeft = totalDays % 30; // Remaining days

        return string(abi.encodePacked(
            uint2str(TotalYears), " years, ",
            uint2str(months), " months, ",
            uint2str(daysLeft), " days"
        ));
    }

    // Helper function to convert uint to string
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}
