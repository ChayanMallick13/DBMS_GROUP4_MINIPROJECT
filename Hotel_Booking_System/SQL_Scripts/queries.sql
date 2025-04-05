USE HOTEL_MANAGEMENT_SYSTEM;

-- Query 1
SELECT * FROM Rooms 
WHERE AvailabilityStatus = 'Available';

-- Query 2
SELECT b.BookingID, g.Name, r.RoomType, b.CheckInDate, b.CheckOutDate
FROM Bookings b
JOIN Guests g ON b.GuestID = g.GuestID
JOIN Rooms r ON b.RoomID = r.RoomID
WHERE g.GuestID = 1;

-- Query 3
UPDATE Rooms
SET AvailabilityStatus = 'Booked'
WHERE RoomID = 102;

-- Query 4
SELECT SUM(Amount) AS TotalEarnings
FROM Payments;

-- Query 5
SELECT g.Name, COUNT(b.BookingID) AS BookingCount
FROM Guests g
JOIN Bookings b ON g.GuestID = b.GuestID
GROUP BY g.Name
HAVING COUNT(b.BookingID) > 1;

-- Query 6
SELECT r.RoomID, r.RoomType, b.CheckInDate, b.CheckOutDate
FROM Rooms r
JOIN Bookings b ON r.RoomID = b.RoomID
WHERE MONTH(b.CheckInDate) = 4 AND YEAR(b.CheckInDate) = 2025;

-- Query 7
DELETE FROM Bookings
WHERE BookingID = 2;

UPDATE Rooms
SET AvailabilityStatus = 'Available'
WHERE RoomID = 101;

SELECT * FROM Bookings b RIGHT JOIN Rooms r ON b.RoomID = r.RoomID;

-- Query 8
SELECT b.BookingID, g.Name, r.RoomType, p.Amount
FROM Payments p
JOIN Bookings b ON p.BookingID = b.BookingID
JOIN Guests g ON b.GuestID = g.GuestID
JOIN Rooms r ON b.RoomID = r.RoomID
WHERE p.Amount > 500;

-- Query 9
SELECT r.RoomType, COUNT(b.BookingID) AS BookingCount
FROM Rooms r
JOIN Bookings b ON r.RoomID = b.RoomID
GROUP BY r.RoomType
ORDER BY BookingCount DESC
LIMIT 1;

-- Query 10
SELECT g.Name, b.CheckInDate, b.CheckOutDate, DATEDIFF(b.CheckOutDate, b.CheckInDate) AS Duration
FROM Guests g
JOIN Bookings b ON g.GuestID = b.GuestID
ORDER BY Duration DESC
LIMIT 1;
