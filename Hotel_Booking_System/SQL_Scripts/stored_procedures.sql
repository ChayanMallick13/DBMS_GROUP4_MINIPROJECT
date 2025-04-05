

USE HOTEL_MANAGEMENT_SYSTEM;

DROP PROCEDURE IF EXISTS make_booking ;

DELIMITER $$
CREATE PROCEDURE make_booking(
	IN p_guestId INT ,
    IN p_roomId INT ,
    IN p_inDate DATE ,
    IN p_outdate DATE
)
BEGIN

	DECLARE v_newBid INT;
    DECLARE v_newPid INT;
    DECLARE v_amount DECIMAL(10,2);
    
    SELECT MAX(BookingID) + 1
    INTO v_newBid
    FROM Bookings;
    
    SELECT MAX(PaymentId) +1 
    INTO v_newPid
    FROM Payments;
    
    SELECT Price 
    INTO v_amount
    FROM Rooms WHERE 
    RoomID = p_roomId;
    
    
    INSERT INTO Bookings VALUES (v_newBid,p_guestId,p_roomId,p_inDate,p_outdate);
    INSERT INTO Payments VALUES (v_newPid,v_newBid,v_amount,p_inDate);

END $$
delimiter ;


DROP PROCEDURE IF EXISTS delete_Booking;

delimiter $$
CREATE PROCEDURE delete_Booking(
	IN p_booking_id INT
)
BEGIN

	DELETE FROM Bookings
    WHERE BookingId = p_booking_id;


END $$
delimiter ;