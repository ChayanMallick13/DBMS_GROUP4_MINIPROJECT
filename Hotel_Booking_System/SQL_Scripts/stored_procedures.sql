USE HOTEL_MANAGEMENT_SYSTEM;

DROP PROCEDURE IF EXISTS sp_BookRoom;

DELIMITER $$
CREATE PROCEDURE sp_BookRoom (
    IN p_BookingID INT,       
    IN p_GuestID INT,        
    IN p_RoomID INT,          
    IN p_CheckInDate DATE,   
    IN p_CheckOutDate DATE,  
    IN p_Amount DECIMAL(10,2)
)
BEGIN
   
    INSERT INTO Bookings (BookingID, GuestID, RoomID, CheckInDate, CheckOutDate)
    VALUES (p_BookingID, p_GuestID, p_RoomID, p_CheckInDate, p_CheckOutDate);
    
    
    INSERT INTO Payments (PaymentID, BookingID, Amount, PaymentDate)
    VALUES (p_BookingID, p_BookingID, p_Amount, CURDATE());
    
    
    UPDATE Rooms
    SET AvailabilityStatus = 'Booked'
    WHERE RoomID = p_RoomID;

    SELECT * FROM Bookings b JOIN Payments p ON b.BookingID = p.BookingID JOIN Rooms r ON r.RoomID = b.RoomID; 
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_GetGuestBookings;


DELIMITER $$
CREATE PROCEDURE sp_GetGuestBookings (
    IN p_GuestID INT
)
BEGIN
    SELECT b.BookingID, g.Name, r.RoomType, b.CheckInDate, b.CheckOutDate, p.Amount
    FROM Bookings b
    JOIN Guests g ON b.GuestID = g.GuestID
    JOIN Rooms r ON b.RoomID = r.RoomID
    LEFT JOIN Payments p ON b.BookingID = p.BookingID
    WHERE g.GuestID = p_GuestID;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_ListBookingsWithCursor;


DELIMITER $$
CREATE PROCEDURE sp_ListBookingsWithCursor()
BEGIN
    DECLARE v_BookingID INT;
    DECLARE v_GuestID INT;
    DECLARE v_RoomID INT;
    DECLARE v_CheckIn DATE;
    DECLARE v_CheckOut DATE;
    DECLARE done INT DEFAULT 0;
    
    DECLARE bookingCursor CURSOR FOR
        SELECT BookingID, GuestID, RoomID, CheckInDate, CheckOutDate FROM Bookings;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN bookingCursor;
    read_loop: LOOP
        FETCH bookingCursor INTO v_BookingID, v_GuestID, v_RoomID, v_CheckIn, v_CheckOut;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        SELECT v_BookingID AS BookingID, v_GuestID AS GuestID, v_RoomID AS RoomID, v_CheckIn AS CheckInDate, v_CheckOut AS CheckOutDate;
    END LOOP;
    CLOSE bookingCursor;
END $$
DELIMITER ;
