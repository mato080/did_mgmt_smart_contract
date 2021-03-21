pragma solidity ^0.8.2;
//SPDX-License-Identifier: UNLICENSED

contract DecentralizedID {
    
    struct PersonalData {
        string fName;
        string lName;
        string birthday;
        string email;
        uint phoneNumber;
        string homeAddress;
        uint sharing_time;
        address shared_address;
    }
    mapping (address => PersonalData) personalData;
    
    struct Education {
        string fullName;
        string birthday;
        string university;
        string faculty;
        string bachelorDegree;
        string masterDegree;
        uint sharing_time;
        address shared_address;
    }
    mapping (address => Education) education;
    
    struct IdentityCard {
        string idNumber;
        string fName;
        string lName;
        string birthday;
        string homeAddress;
        string personalNumber;
        uint sharing_time;
        address shared_address;
    }
    mapping (address => IdentityCard) identityCard;
    
    struct DrivingLicence {
        string idNumber;
        string fName;
        string lName;
        string birthday;
        string issued;
        string category;
        uint sharing_time;
        address shared_address;
    }
    mapping (address => DrivingLicence) drivingLicence;
 
    struct ShippingAddress {
        string fullName;
        string email;
        uint phoneNumber;
        string apartment;
        uint zipCode;
        string city;
        uint sharing_time;
        address shared_address;
    }
    mapping (address => ShippingAddress) shippingAddress;
    
    struct Login {
  //    address addressX;
        string fName;
        string lName;
        string email;
        uint sharing_time;
        address shared_address;
    }
    mapping (address => Login) login;
    
    
    
    function sharePersonalData(address _address, uint time) public { 
        personalData[_address].sharing_time = block.timestamp + (time * 1 minutes);
        personalData[msg.sender].shared_address = _address;
    }
    function shareEducation(address _address, uint time) public { 
        education[_address].sharing_time = block.timestamp + (time * 1 minutes);
        education[msg.sender].shared_address = _address;
    }
    function shareIdentityCard(address _address, uint time) public { 
        identityCard[_address].sharing_time = block.timestamp + (time * 1 minutes);
        identityCard[msg.sender].shared_address = _address;
    }
    function shareDrivingLicence(address _address, uint time) public { 
        drivingLicence[_address].sharing_time = block.timestamp + (time * 1 minutes);
        drivingLicence[msg.sender].shared_address = _address;
    }
    function shareShippingAddress(address _address, uint time) public { 
        shippingAddress[_address].sharing_time = block.timestamp + (time * 1 minutes);
        shippingAddress[msg.sender].shared_address = _address;
    }
    function shareLogin(address _address, uint time) public { 
        login[_address].sharing_time = block.timestamp + (time * 1 minutes);
        login[msg.sender].shared_address = _address;
    }
    
    
    function viewPersonalData(address _address) view public returns (string memory, string memory, string memory, string memory, uint, string memory, uint){
        require(block.timestamp < personalData[msg.sender].sharing_time);
        require(personalData[_address].shared_address == msg.sender);
        return (personalData[_address].fName, personalData[_address].lName, personalData[_address].birthday, personalData[_address].email, personalData[_address].phoneNumber, personalData[_address].homeAddress, personalData[msg.sender].sharing_time);
    }
    function viewEducation(address _address) view public returns (string memory, string memory, string memory, string memory, string memory, string memory, uint){
        require(block.timestamp < education[msg.sender].sharing_time);
        require(education[_address].shared_address == msg.sender);
        return (education[_address].fullName, education[_address].birthday, education[_address].university, education[_address].faculty, education[_address].bachelorDegree, education[_address].masterDegree, education[msg.sender].sharing_time);
    }
    function viewIdentityCard(address _address) view public returns (string memory, string memory, string memory, string memory, string memory, string memory, uint){
        require(block.timestamp < identityCard[msg.sender].sharing_time);
        require(identityCard[_address].shared_address == msg.sender);
        return (identityCard[_address].idNumber, identityCard[_address].fName, identityCard[_address].lName, identityCard[_address].birthday, identityCard[_address].homeAddress, identityCard[_address].personalNumber, identityCard[msg.sender].sharing_time);
    }
    function viewDrivingLicence(address _address) view public returns (string memory, string memory, string memory, string memory, string memory, string memory, uint){
        require(block.timestamp < drivingLicence[msg.sender].sharing_time);
        require(drivingLicence[_address].shared_address == msg.sender);
        return (drivingLicence[_address].idNumber, drivingLicence[_address].fName, drivingLicence[_address].lName, drivingLicence[_address].birthday, drivingLicence[_address].issued, drivingLicence[_address].category, drivingLicence[msg.sender].sharing_time);
    }
    function viewShippingAddress(address _address) view public returns (string memory, string memory, uint, string memory, uint, string memory, uint){
        require(block.timestamp < shippingAddress[msg.sender].sharing_time);
        require(shippingAddress[_address].shared_address == msg.sender);
        return (shippingAddress[_address].fullName, shippingAddress[_address].email, shippingAddress[_address].phoneNumber, shippingAddress[_address].apartment, shippingAddress[_address].zipCode, shippingAddress[_address].city, shippingAddress[msg.sender].sharing_time);
    }
    function viewLogin(address _address) view public returns (string memory, string memory, string memory, uint){
        require(block.timestamp < login[msg.sender].sharing_time);
        require(login[_address].shared_address == msg.sender);
        return (login[_address].fName, login[_address].lName, login[_address].email, login[msg.sender].sharing_time);
    }
    
        
    function setPersonalData(address _address, string memory _fName, string memory _lName, string memory _birthday, string memory _email, uint _phoneNumber, string memory _homeAddress) public {
        personalData[_address].fName = _fName;
        personalData[_address].lName = _lName;
        personalData[_address].birthday = _birthday;
        personalData[_address].email = _email;
        personalData[_address].phoneNumber = _phoneNumber;
        personalData[_address].homeAddress = _homeAddress;
    }
    function setEducation(address _address, string memory _fullName, string memory _birthday, string memory _university, string memory _faculty, string memory _bachelorDegree, string memory _masterDegree) public {
        education[_address].fullName = _fullName;
        education[_address].birthday = _birthday;
        education[_address].university = _university;
        education[_address].faculty = _faculty;
        education[_address].bachelorDegree = _bachelorDegree;
        education[_address].masterDegree = _masterDegree;
    }
    function setIdentityCard(address _address, string memory _idNumber, string memory _fName, string memory _lName, string memory _birthday, string memory _homeAddress, string memory _personalNumber) public {
        identityCard[_address].idNumber = _idNumber;
        identityCard[_address].fName = _fName;
        identityCard[_address].lName = _lName;
        identityCard[_address].birthday = _birthday;
        identityCard[_address].homeAddress = _homeAddress;
        identityCard[_address].personalNumber = _personalNumber;
    }
    function setDrivingLicence(address _address, string memory _idNumber, string memory _fName, string memory _lName, string memory _birthday, string memory _issued, string memory _category) public {
        drivingLicence[_address].idNumber = _idNumber;
        drivingLicence[_address].fName = _fName;
        drivingLicence[_address].lName = _lName;
        drivingLicence[_address].birthday = _birthday;
        drivingLicence[_address].issued = _issued;
        drivingLicence[_address].category = _category;
    }
    function setShippingAddress(address _address, string memory _fullName, string memory _email, uint _phoneNumber, string memory _apartment, uint _zipCode, string memory _city) public {
        shippingAddress[_address].fullName = _fullName;
        shippingAddress[_address].email = _email;
        shippingAddress[_address].phoneNumber = _phoneNumber;
        shippingAddress[_address].apartment = _apartment;
        shippingAddress[_address].zipCode = _zipCode;
        shippingAddress[_address].city = _city;
    }
    function setLogin(address _address, string memory _fName, string memory _lName, string memory _email) public {
        login[_address].fName = _fName;
        login[_address].lName = _lName;
        login[_address].email = _email;
    }
  
  
    function getPersonalData(address _address) view public returns (string memory, string memory, string memory, string memory, uint, string memory) {
        return (personalData[_address].fName, personalData[_address].lName, personalData[_address].birthday, personalData[_address].email, personalData[_address].phoneNumber, personalData[_address].homeAddress);
    }
    function getEducation(address _address) view public returns (string memory, string memory, string memory, string memory, string memory, string memory) {
        return (education[_address].fullName, education[_address].birthday, education[_address].university, education[_address].faculty, education[_address].bachelorDegree, education[_address].masterDegree);
    }
    function getIdentityCard(address _address) view public returns (string memory, string memory, string memory, string memory, string memory, string memory) {
        return (identityCard[_address].idNumber, identityCard[_address].fName, identityCard[_address].lName, identityCard[_address].birthday, identityCard[_address].homeAddress, identityCard[_address].personalNumber);
    }
    function getDrivingLicence(address _address) view public returns (string memory, string memory, string memory, string memory, string memory, string memory) {
        return (drivingLicence[_address].idNumber, drivingLicence[_address].fName, drivingLicence[_address].lName, drivingLicence[_address].birthday, drivingLicence[_address].issued, drivingLicence[_address].category);
    }
    function getShippingAddress(address _address) view public returns (string memory, string memory, uint, string memory, uint, string memory) {
        return (shippingAddress[_address].fullName, shippingAddress[_address].email, shippingAddress[_address].phoneNumber, shippingAddress[_address].apartment, shippingAddress[_address].zipCode, shippingAddress[_address].city);
    }
    function getLogin(address _address) view public returns (string memory, string memory, string memory) {
        return (login[_address].fName, login[_address].lName, login[_address].email);
    }
}