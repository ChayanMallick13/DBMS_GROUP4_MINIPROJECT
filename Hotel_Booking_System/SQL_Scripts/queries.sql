
USE HOTEL_MANAGEMENT_SYSTEM;


-- Query 1
SELECT * FROM Rooms
WHERE AvaibilityStatus = TRUE;


-- Query 2
SELECT * FROM 
Bookings b NATURAL JOIN Payments p
WHERE b.GuestID = 2;

-- Query 3
CALL make_booking(
	2,
    1,
    '2025-04-03',
    '2025-04-13'
);
-- show result
SELECT * FROM Bookings;

-- Query 4
SELECT SUM(Amount) AS Total_Earnings FROM
Payments;

-- Query 5
SELECT * FROM
(
	SELECT GuestId , COUNT(BookingId) AS Booking_Count FROM Bookings GROUP BY GuestId HAVING Booking_Count > 1
) b
NATURAL JOIN Guests;

-- Query 6
SELECT * FROM (SELECT RoomID,CheckInDate,CheckOutDate FROM Bookings 
WHERE CheckInDate >= '2025-04-01' AND CheckOutDate <= '2025-04-30') b
NATURAL JOIN Rooms;

-- Query 7
CALL delete_Booking(6);
-- show result
SELECT * FROM Bookings;

-- Query 8
SELECT * FROM 
(SELECT * FROM Payments WHERE Amount > 500) p
NATURAL JOIN Bookings;

-- Query 9
SELECT r.RoomType , r.Price, COUNT(b.BookingId) AS Bookings_count FROM
Bookings b NATURAL JOIN Rooms r
GROUP BY r.RoomType,r.Price
HAVING Bookings_count >= ALL (
	SELECT COUNT(b.BookingId) AS cnt FROM
	Bookings b NATURAL JOIN Rooms r
	GROUP BY r.RoomType,r.Price
)
;


-- Query 10
SELECT * FROM 
(
SELECT GuestID,(CheckOutDate-CheckInDate) AS stayDuration FROM
		Bookings WHERE (CheckOutDate-CheckInDate) >=  (
			SELECT MAX((CheckOutDate-CheckInDate)) FROM
			Bookings
		)
) b
NATURAL JOIN 
Guests g;
        

