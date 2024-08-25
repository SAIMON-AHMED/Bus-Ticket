// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TicketBooking {

    uint[] seats = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    mapping(uint => bool) isBooked;
    mapping(address => uint[]) booked;
    uint[] available;
    //To book seats
    function bookSeats(uint[] memory seatNumbers) public {
        require(seatNumbers.length > 0 && seatNumbers.length <= 4);
        require(booked[msg.sender].length + seatNumbers.length <= 4);
        uint index = 0;
        while(index < seatNumbers.length - 1) {
            for (uint i = index + 1; i < seatNumbers.length; i++) {
                if (seatNumbers[index] == seatNumbers[i] ||
                isBooked[seatNumbers[i]]) {
                    revert();
                }
            }
            index++;
        }

        for (uint i; i < seatNumbers.length; i++) {
            require(seatNumbers[i] > 0 && seatNumbers[i] <= 20);
            isBooked[seatNumbers[i]] = true;
            booked[msg.sender].push(seatNumbers[i]);
        }
    }

                    
    
    //To get available seats
    function showAvailableSeats() public  returns (uint[] memory) {
        
        for (uint i = 1; i <= 20; i++) {
            if (!isBooked[i]) {
                available.push(i);
            }
        }
        return available;
    }
    
    //To check availability of a seat
    function checkAvailability(uint seatNumber) public view returns (bool) {
        require(seatNumber > 0 && seatNumber <= 20);
        return !isBooked[seatNumber];
    }
    
    //To check tickets booked by the user
    function myTickets() public view returns (uint[] memory) {
        return booked[msg.sender];
    }
}
