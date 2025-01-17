// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract Aitu_SE2315_Yussupov_Zhangir is ERC20, ERC20Permit {
    constructor()
        ERC20("Aitu_SE-2315_Yussupov_Zhangir", "MTK")
        ERC20Permit("Aitu_SE-2315_Yussupov_Zhangir") payable
    {
        _mint(msg.sender, 2000 * 10 ** decimals());
    }
}

contract YussupovZhangir is ERC20 {
    struct Transaction {
        address sender;
        address receiver;
        uint256 amount;
        uint256 timestamp;
    }

    Transaction[] public transactions;

    constructor() ERC20("YussupovZhangir", "UTK") {
        _mint(msg.sender, 2000 * 10 ** decimals());
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        transactions.push(Transaction({
            sender: msg.sender,
            receiver: recipient,
            amount: amount,
            timestamp: block.timestamp
        }));
        return true;
    }

    function getTransactionDetails(uint256 index) public view returns (address, address, uint256, uint256) {
        Transaction memory txn = transactions[index];
        return (txn.sender, txn.receiver, txn.amount, txn.timestamp);
    }

    function getLatestTransactionTimestamp() public view returns (string memory) {
        if (transactions.length == 0) return "No transactions yet";
        return string(abi.encodePacked(transactions[transactions.length - 1].timestamp));
    }

    function getTransactionSender(uint256 index) public view returns (address) {
        return transactions[index].sender;
    }

    function getTransactionReceiver(uint256 index) public view returns (address) {
        return transactions[index].receiver;
    }
}
