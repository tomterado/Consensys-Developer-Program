pragma solidity ^0.5.0;


contract ProofOfExistence2 {
  bytes32[] private proofs;

  //store
  function storeProof(bytes32 proof) public {
    proofs.push(proof);
  }

  function notraise(string calldata document) external {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }

  function proofFor(string memory document) public pure returns (bytes32) {
    return sha256(abi.encodePacked(document));
  }
  
  function checkDocument(string memory document) public view returns (bool) {
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }

  function hasProof(bytes32 proof) internal view returns (bool){
    for (uint256 i= 0; i < proofs.length; i++){
      if (proofs[i] == proof){
        return true;
      }
    }
    return false;
  }

}
