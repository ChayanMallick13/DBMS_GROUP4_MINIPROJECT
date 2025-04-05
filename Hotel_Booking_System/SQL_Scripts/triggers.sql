USE HOTEL_MANAGEMENT_SYSTEM;

-- Drop trigger for after inserting a booking if it exists.
DROP TRIGGER IF EXISTS trg_after_booking_insert;

-- Create a trigger that automatically sets the room status to 'Booked' after a new booking is inserted.
DELIMITER $$
CREATE TRIGGER trg_after_booking_insert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET AvailabilityStatus = 'Booked'
    WHERE RoomID = NEW.RoomID;
END $$
DELIMITER ;

-- Drop trigger for after deleting a booking if it exists.
DROP TRIGGER IF EXISTS trg_after_booking_delete;

-- Create a trigger that automatically sets the room status to 'Available' after a booking is deleted.
DELIMITER $$
CREATE TRIGGER trg_after_booking_delete
AFTER DELETE ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET AvailabilityStatus = 'Available'
    WHERE RoomID = OLD.RoomID;
END $$
DELIMITER ;
