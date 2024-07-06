pragma solidity ^0.8.19;
contract ERC721 {

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    mapping (address => uint) internal balance;
    mapping (uint => address) internal ownerShip;
    mapping (uint => address) private Approved;
    mapping (address => mapping(address => bool)) Operator;

    function balanceOf(address owner) public view returns (uint256){
        require(owner != address(0), "Can not check the balance of the zero address" );
        return balance[owner];
    }

    function ownerOf(uint256 tokenId) public view returns (address){
        require(ownerShip[tokenId] != address(0), "NFT is not exsit");
        return ownerShip[tokenId];
    }

    function transferFrom(address from, address to, uint256 tokenId) external payable{
        address owner = ownerShip[tokenId];
        require(msg.sender == owner || msg.sender == Approved[tokenId] || Operator[owner][msg.sender] == true, "You don not have permision to do this function");
        require(owner == from, " sender is not owner of NFT");
        require(to != address(0), "Can not send to the zero address");
        require(owner != address(0), "NFT is not exsit");
        Approved[tokenId] = address(0);
        ownerShip[tokenId] = from;
        balance[from] -= 1;
        balance[to] += 1;
        emit Transfer(from, to, tokenId);
    }

    function approve(address approved, uint256 tokenId) external payable{
        address owner = ownerShip[tokenId];
        require(msg.sender == owner, "Only owner can do approve function");
        emit Approval(owner, approved, tokenId);
        Approved[tokenId] = approved;
    }

    function setApprovalForAll(address operator, bool approved) external{
        emit ApprovalForAll(msg.sender, operator, approved);
        Operator[msg.sender][operator] = approved;
    }

    function getApproved(uint256 tokenId) external view returns (address){
        require(ownerShip[tokenId] != address(0), "NFT is not exsit");
        return Approved[tokenId];
    }

    function isApprovedForAll(address owner, address operator) external view returns (bool){
        return Operator[owner][operator];
    }
    function supportInterface(bytes4 interfaceId) public pure virtual returns(bool){
        return interfaceId == 0x80ac58cd;
    }
}

    