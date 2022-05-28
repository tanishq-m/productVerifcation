pragma solidity ^0.6.12;
contract Productrecord{
    
    struct property{
     
     address ownerAddr;
     string ownername;
     string productname;
     uint price;
     }
  
     address owner; 
      constructor() public{
        owner = msg.sender;
     }
    
     modifier onlycreater() {
        require(owner == msg.sender);
       _;
    }
    // uint256 newPid = 0;
    mapping(uint256 => property) properties;
   
    function Product_details(uint256 _pId, address _owner, string memory _ownername, string memory _productname, uint _price) public onlycreater returns(uint256) {
        properties[_pId].ownerAddr = _owner;
        properties[_pId].ownername=_ownername;
        properties[_pId].productname=_productname;
        properties[_pId].price = _price;
        // return newPid++;
        // newPid++;
        
        }
        
     function update_product_owner(uint256 _pId,string memory _ownername, address newOwnerAddress) public {
            require(properties[_pId].ownerAddr == msg.sender);
            properties[_pId].ownerAddr = newOwnerAddress;
            properties[_pId].ownername = _ownername;
        }    
       
        
    function get_product_details(uint256 _pId) public view returns(address, string memory, string memory, uint) {
       return(properties[_pId].ownerAddr , properties[_pId].ownername , properties[_pId].productname , properties[_pId].price );
        }  
    
    
    function validate_ID_details(uint256 _pId, address testOwner) public  view returns(bool){
        if(properties[_pId].ownerAddr == testOwner)
        { 
            return true;
        }
         return false;
      }

    
}
