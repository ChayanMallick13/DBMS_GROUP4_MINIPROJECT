CREATE DATABASE IF NOT EXISTS HOTEL_MANAGEMENT_SYSTEM;

USE HOTEL_MANAGEMENT_SYSTEM;

CREATE TABLE IF NOT EXISTS Guests (
    GuestID INT PRIMARY KEY,           
    Name VARCHAR(100) NOT NULL,         
    Contact VARCHAR(20) NOT NULL,       
    Email VARCHAR(100) NOT NULL UNIQUE  
);

CREATE TABLE IF NOT EXISTS Rooms (
    RoomID INT PRIMARY KEY,             
    RoomType VARCHAR(50) NOT NULL,     
    Price DECIMAL(10,2) NOT NULL,        
    AvailabilityStatus VARCHAR(20) NOT NULL  
);

CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,         
    GuestID INT NOT NULL,               
    RoomID INT NOT NULL,                
    CheckInDate DATE NOT NULL,          
    CheckOutDate DATE NOT NULL,         
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID)
    ON DELETE CASCADE  
    ON UPDATE CASCADE,
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
    ON DELETE CASCADE  
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Payments (
    PaymentID INT PRIMARY KEY,         
    BookingID INT NOT NULL,             
    Amount DECIMAL(10,2) NOT NULL,       
    PaymentDate DATE NOT NULL,         
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);
