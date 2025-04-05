USE HOTEL_MANAGEMENT_SYSTEM;

-- 1. Retrieve all available rooms.
SELECT * FROM Rooms 
WHERE AvailabilityStatus = 'Available';

-- 2. Get booking details for a specific guest (example: GuestID = 1).
SELECT b.BookingID, g.Name, r.RoomType, b.CheckInDate, b.CheckOutDate
FROM Bookings b
JOIN Guests g ON b.GuestID = g.GuestID
JOIN Rooms r ON b.RoomID = r.RoomID
WHERE g.GuestID = 1;

-- 3. Update room availability: Set RoomID 102 to 'Booked'.
UPDATE Rooms
SET AvailabilityStatus = 'Booked'
WHERE RoomID = 102;

-- 4. Calculate total earnings from payments.
SELECT SUM(Amount) AS TotalEarnings
FROM Payments;

-- 5. Find guests with multiple bookings.
SELECT g.Name, COUNT(b.BookingID) AS BookingCount
FROM Guests g
JOIN Bookings b ON g.GuestID = b.GuestID
GROUP BY g.Name
HAVING COUNT(b.BookingID) > 1;

-- 6. List rooms occupied in April 2025.
SELECT r.RoomID, r.RoomType, b.CheckInDate, b.CheckOutDate
FROM Rooms r
JOIN Bookings b ON r.RoomID = b.RoomID
WHERE MONTH(b.CheckInDate) = 4 AND YEAR(b.CheckInDate) = 2025;

-- 7. Delete a booking (BookingID = 2) and update room status to 'Available'.
DELETE FROM Bookings
WHERE BookingID = 2;

UPDATE Rooms
SET AvailabilityStatus = 'Available'
WHERE RoomID = 101;

-- 7a. Show updated Bookings table after deletion to confirm the deletion.
SELECT * FROM Bookings;

-- 8. Retrieve bookings with payments above 500.
SELECT b.BookingID, g.Name, r.RoomType, p.Amount
FROM Payments p
JOIN Bookings b ON p.BookingID = b.BookingID
JOIN Guests g ON b.GuestID = g.GuestID
JOIN Rooms r ON b.RoomID = r.RoomID
WHERE p.Amount > 500;

-- 9. Find the most booked room type.
SELECT r.RoomType, COUNT(b.BookingID) AS BookingCount
FROM Rooms r
JOIN Bookings b ON r.RoomID = b.RoomID
GROUP BY r.RoomType
ORDER BY BookingCount DESC
LIMIT 1;

-- 10. Identify the guest with the longest stay.
SELECT g.Name, b.CheckInDate, b.CheckOutDate, DATEDIFF(b.CheckOutDate, b.CheckInDate) AS Duration
FROM Guests g
JOIN Bookings b ON g.GuestID = b.GuestID
ORDER BY Duration DESC
LIMIT 1;
