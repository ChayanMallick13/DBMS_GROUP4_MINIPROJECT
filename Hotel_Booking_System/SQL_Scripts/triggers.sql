USE HOTEL_MANAGEMENT_SYSTEM;

DROP TRIGGER IF EXISTS trg_after_booking_insert;

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

DROP TRIGGER IF EXISTS trg_after_booking_delete;

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
