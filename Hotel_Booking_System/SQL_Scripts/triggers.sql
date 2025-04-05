

USE HOTEL_MANAGEMENT_SYSTEM;

DROP TRIGGER IF EXISTS trg_after_booking;

delimiter $$
CREATE TRIGGER trg_after_booking
AFTER INSERT ON bookings
FOR EACH ROW
BEGIN

	UPDATE Rooms 
    SET AvaibilityStatus = FALSE
    WHERE RoomID = NEW.RoomID;

END $$
delimiter ;


DROP TRIGGER IF EXISTS tgr_delete_bookings;

delimiter $$
CREATE TRIGGER delete_Booking 
AFTER DELETE ON Bookings
FOR EACH ROW
BEGIN

	UPDATE Rooms 
    SET AvaibilityStatus = TRUE
    WHERE RoomID = OLD.RoomID;

END $$
delimiter ;