
USE HOTEL_MANAGEMENT_SYSTEM;


INSERT INTO Guests Values 
(1,'Sai Rohan','916645656578','rohan.example@gmail.com'),
(2,'Ayush Kumar','1234567890','ayush1.example@gmail.com'),
(3,'Chayan Mallick','879623457','chayan4.example@gmail.com'),
(4,'Somnath R','1487962354','som.example@gmail.com'),
(5,'SuryaVanshi S','4178963214','surya.example@gmail.com')
;


INSERT INTO Rooms Values
(1,'Single',400,true),
(2,'Double',700,true),
(3,'Suite',1400,false),
(4,'Premiuin',2300,false),
(5,'VIP',3300,false),
(6,'Single',400,false),
(7,'Double',700,false),
(8,'Suite',1400,true),
(9,'Premiuin',2300,true)
;

update Rooms set AvaibilityStatus = true where RoomID = 8;


INSERT INTO Bookings Values
(1,1, 3,'2025-04-01','2025-04-17'),
(2,2,4,'2025-04-03','2025-04-14'),
(3,3,6,'2025-04-02','2025-04-10'),
(4,3,7,'2025-04-01','2025-04-20'),
(5,1,5,'2025-04-02','2025-04-30')
;

INSERT INTO Payments Values
(1,1,1400,'2025-04-01'),
(2,2,2300,'2025-04-03'),
(3,3,400,'2025-04-02'),
(4,4,700,'2025-04-01'),
(5,5,3300,'2025-04-02')
;