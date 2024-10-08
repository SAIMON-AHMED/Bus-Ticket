# Bus-Ticket

Management of a bus travel agency is trying to see if they can make the ticket booking process hassle free and open to all by implementing smart contracts. For that, they have decided to first implement a smaller version of smart contract for testing purposes.

The rules are as follows:


1. There are available 20 seats initially, numbered from 1 to 20.
2. At most 4 tickets can be booked from 1 address.

The smart contract should be as follows, with the following public functions:

 

Input:
bookSeats(uint[] seatNumbers): This function should take an array of seat numbers as input. The array must not be empty and the length of the array can not be more than 4. If the array does not contain only the available seats (without any repitition), then the function must revert.

 

Output:
showAvailableSeats() returns (uint[]): This function should return the array of all the seat numbers that are available. The order of the seat number can be anything.

checkAvailability(uint seatNumber) returns (bool):Using this function, availability of a seat can be checked. If seat corresponding to seatNumber is available, then the function must return true, else it must return false.

myTickets() returns (uint[]):This function should return an array consisting of all the seat numbers booked by the address which triggers this function. In case, there are no seats booked, an empty array will be returned.
