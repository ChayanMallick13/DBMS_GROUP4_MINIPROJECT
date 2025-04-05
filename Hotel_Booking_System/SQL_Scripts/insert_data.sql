USE HOTEL_MANAGEMENT_SYSTEM;

INSERT INTO Guests (GuestID, Name, Contact, Email) VALUES 
(1, 'Alice Johnson', '555-1234', 'alice@example.com'),
(2, 'Bob Smith', '555-5678', 'bob@example.com'),
(3, 'Carol Williams', '555-8765', 'carol@example.com'),
(4, 'David Lee', '555-4321', 'david@example.com'),
(5, 'Eva Brown', '555-6789', 'eva@example.com'),
(6, 'Frank Miller', '555-9876', 'frank@example.com'),
(7, 'Grace Wilson', '555-2468', 'grace@example.com'),
(8, 'Henry Davis', '555-1357', 'henry@example.com');

INSERT INTO Rooms (RoomID, RoomType, Price, AvailabilityStatus) VALUES 
(101, 'Single', 275.00, 'Available'),
(102, 'Double', 420.00, 'Available'),
(103, 'Suite', 2950.00, 'Available'),
(104, 'Deluxe', 1200.00, 'Available'),
(105, 'Single', 80.00, 'Under Maintenance'),
(106, 'Double', 130.00, 'Available');

INSERT INTO Bookings (BookingID, GuestID, RoomID, CheckInDate, CheckOutDate) VALUES 
(1, 1, 102, '2025-04-15', '2025-04-20'),
(2, 2, 101, '2025-04-16', '2025-04-18'),
(3, 1, 103, '2025-05-01', '2025-05-05'),
(4, 3, 104, '2025-04-10', '2025-04-12'),
(5, 4, 106, '2025-04-20', '2025-04-25'),
(6, 5, 102, '2025-05-05', '2025-05-10'),
(7, 6, 104, '2025-05-10', '2025-05-15'),
(8, 7, 103, '2025-05-15', '2025-05-20'),
(9, 8, 106, '2025-06-01', '2025-06-05');

INSERT INTO Payments (PaymentID, BookingID, Amount, PaymentDate) VALUES 
(1, 1, 600.00, '2025-04-15'),
(2, 2, 150.00, '2025-04-16'),
(3, 3, 1000.00, '2025-05-01'),
(4, 4, 750.00, '2025-04-10'),
(5, 5, 650.00, '2025-04-20'),
(6, 6, 600.00, '2025-05-05'),
(7, 7, 900.00, '2025-05-10'),
(8, 8, 1100.00, '2025-05-15'),
(9, 9, 500.00, '2025-06-01');
