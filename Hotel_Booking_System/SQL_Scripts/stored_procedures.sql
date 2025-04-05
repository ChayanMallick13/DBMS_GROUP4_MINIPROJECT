USE HOTEL_MANAGEMENT_SYSTEM;

-- Drop the stored procedure sp_BookRoom if it exists.
DROP PROCEDURE IF EXISTS sp_BookRoom;

-- Create the stored procedure sp_BookRoom.
DELIMITER $$
CREATE PROCEDURE sp_BookRoom (
    IN p_BookingID INT,       -- Booking ID provided manually.
    IN p_GuestID INT,         -- Guest ID making the booking.
    IN p_RoomID INT,          -- Room ID to be booked.
    IN p_CheckInDate DATE,    -- Check-in date.
    IN p_CheckOutDate DATE,   -- Check-out date.
    IN p_Amount DECIMAL(10,2) -- Payment amount.
)
BEGIN
    -- Insert a new booking record.
    INSERT INTO Bookings (BookingID, GuestID, RoomID, CheckInDate, CheckOutDate)
    VALUES (p_BookingID, p_GuestID, p_RoomID, p_CheckInDate, p_CheckOutDate);
    
    -- Insert a payment record corresponding to the booking.
    INSERT INTO Payments (PaymentID, BookingID, Amount, PaymentDate)
    VALUES (p_BookingID, p_BookingID, p_Amount, CURDATE());
    
    -- Update the room's availability status to 'Booked'.
    UPDATE Rooms
    SET AvailabilityStatus = 'Booked'
    WHERE RoomID = p_RoomID;
END $$
DELIMITER ;

-- Drop the stored procedure sp_GetGuestBookings if it exists.
DROP PROCEDURE IF EXISTS sp_GetGuestBookings;

-- Create the stored procedure sp_GetGuestBookings.
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

-- Drop the stored procedure sp_ListBookingsWithCursor if it exists.
DROP PROCEDURE IF EXISTS sp_ListBookingsWithCursor;

-- Create the stored procedure sp_ListBookingsWithCursor.
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
        -- Return each booking record.
        SELECT v_BookingID AS BookingID, v_GuestID AS GuestID, v_RoomID AS RoomID, v_CheckIn AS CheckInDate, v_CheckOut AS CheckOutDate;
    END LOOP;
    CLOSE bookingCursor;
END $$
DELIMITER ;
