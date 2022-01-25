pragma solidity >=0.4.22 <0.9.0;

contract MarketBox{
    address sender = msg.sender;
    uint priceValue = 1000;
    uint balance = msg.value;
    uint payment;
    uint box = 0;
    uint[] public numbers = new uint[](10);

    event sendCurrentChange(address x, uint y);

    function setPayment(uint value) public payable minimumValue(priceValue){
        if(balance > priceValue){
            uint  currencyChangeValue = balance - priceValue;
            payable(sender).transfer(currencyChangeValue);
            emit sendCurrentChange(sender, currencyChangeValue);
        }
        payment = value;
    }

    function setpriceValue(uint x) public {
        priceValue = x;
    }
    function confirmPayment () public  {
       box += payment;
    }
   
    modifier minimumValue (uint min){
        require(balance < min, "Ether balance is not enough");
        _;
    }

}