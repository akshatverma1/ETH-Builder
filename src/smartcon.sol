//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Portfolio {
    struct ProofOfWork {
        string role;
        string description;
        string link;
        string company;
        uint256 timestamp;
    }
    
    address public owner;
    ProofOfWork[] public portfolio;
    
    event WorkAdded(string role, string company, uint256 timestamp);
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can add work");
        _;
    }
    
    function addWork(
        string memory _role,
        string memory _description,
        string memory _link,
        string memory _company
    ) public onlyOwner {
        portfolio.push(ProofOfWork({
            role: _role,
            description: _description,
            link: _link,
            company: _company,
            timestamp: block.timestamp
        }));
        
        emit WorkAdded(_role, _company, block.timestamp);
    }

    function getAllWork() public view returns (ProofOfWork[] memory) {
        return portfolio;
    }
    
}