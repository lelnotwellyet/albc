// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Rental {
    string public agencyName;

    event VehicleRented(address customer, uint daysRented, uint rent);

    constructor(string memory _agencyName) {
        agencyName = _agencyName;
    }

    function calculateRent(uint daysRented) public pure virtual returns (uint) {
        return daysRented * 0;
    }

    function rentVehicle(uint daysRented) public {
        uint rent = calculateRent(daysRented);
        emit VehicleRented(msg.sender, daysRented, rent);
    }
}

contract CarRental is Rental {
    constructor() Rental("City Rentals") {}

    function calculateRent(uint daysRented) public pure override returns (uint) {
        return daysRented * 10000;
    }
}

contract BikeRental is Rental {
    constructor() Rental("City Rentals") {}

    function calculateRent(uint daysRented) public pure override returns (uint) {
        return daysRented * 3000;
    }
}
