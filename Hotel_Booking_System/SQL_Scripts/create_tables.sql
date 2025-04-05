CREATE DATABASE IF NOT EXISTS HOTEL_MANAGEMENT_SYSTEM;

USE HOTEL_MANAGEMENT_SYSTEM;

-- Create the Guests table if it does not already exist.
CREATE TABLE IF NOT EXISTS Guests (
    GuestID INT PRIMARY KEY,           -- Unique identifier for each guest (manually set).
    Name VARCHAR(100) NOT NULL,         -- Guest's full name.
    Contact VARCHAR(20) NOT NULL,       -- Guest's contact number.
    Email VARCHAR(100) NOT NULL UNIQUE  -- Guest's unique email address.
);

-- Create the Rooms table if it does not already exist.
CREATE TABLE IF NOT EXISTS Rooms (
    RoomID INT PRIMARY KEY,             -- Unique identifier for each room (manually set).
    RoomType VARCHAR(50) NOT NULL,      -- Type of room (e.g., Single, Double, Suite, Deluxe).
    Price DECIMAL(10,2) NOT NULL,        -- Price per night.
    AvailabilityStatus VARCHAR(20) NOT NULL  -- Room status (e.g., Available, Booked, Under Maintenance).
);

-- Create the Bookings table if it does not already exist.
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,          -- Unique booking identifier (manually set).
    GuestID INT NOT NULL,               -- Reference to a guest.
    RoomID INT NOT NULL,                -- Reference to a room.
    CheckInDate DATE NOT NULL,          -- Check-in date.
    CheckOutDate DATE NOT NULL,         -- Check-out date.
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID)
    ON DELETE CASCADE  -- Automatically delete child rows when parent is deleted
    ON UPDATE CASCADE,
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
    ON DELETE CASCADE  -- Automatically delete child rows when parent is deleted
    ON UPDATE CASCADE
);

-- Create the Payments table if it does not already exist.
CREATE TABLE IF NOT EXISTS Payments (
    PaymentID INT PRIMARY KEY,          -- Unique payment identifier (manually set).
    BookingID INT NOT NULL,             -- Reference to a booking.
    Amount DECIMAL(10,2) NOT NULL,       -- Payment amount.
    PaymentDate DATE NOT NULL,          -- Date of payment.
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
    ON DELETE CASCADE  -- Automatically delete child rows when parent is deleted
    ON UPDATE CASCADE
);
