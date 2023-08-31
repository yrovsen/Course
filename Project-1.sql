CREATE TABLE Customers(
	CustomerID INT NOT NULL PRIMARY KEY, 
	FullName VARCHAR(100) NOT NULL,    
	PhoneNumber INT NOT NULL UNIQUE
    ); 

CREATE TABLE Bookings (   
BookingID INT,   
BookingDate DATE,   
TableNumber INT,    
NumberOfGuests INT,   
CustomerID INT    
);

CREATE TABLE Courses (
CourseName VARCHAR(255) PRIMARY KEY, 
Cost Decimal(4,2)
); 

INSERT INTO Customers(CustomerID, FullName, PhoneNumber) VALUES 
    (1, "Vanessa McCarthy", 0757536378), 
    (2, "Marcos Romero", 0757536379), 
    (3, "Hiroki Yamane", 0757536376), 
    (4, "Anna Iversen", 0757536375),
    (5, "Diana Pinto", 0757536374),
    (6, "Altay Ayhan", 0757636378), 
    (7, "Jane Murphy", 0753536379), 
    (8, "Laurina Delgado", 0754536376), 
    (9, "Mike Edwards", 0757236375),
    (10, "Karl Pederson", 0757936374);   
    
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES
(10, '2021-11-10', 7, 5, 1), 
(11, '2021-11-10', 5, 2, 2), 
(12, '2021-11-10', 3, 2, 4),
(13, '2021-11-11', 2, 5, 5), 
(14, '2021-11-11', 5, 2, 6), 
(15, '2021-11-11', 3, 2, 7),
(16, '2021-11-11', 3, 5, 1), 
(17, '2021-11-12', 5, 2, 2), 
(18, '2021-11-12', 3, 2, 4),
(19, '2021-11-13', 7, 5, 6), 
(20, '2021-11-14', 5, 2, 3), 
(21, '2021-11-14', 3, 2, 4);    

Insert into Courses (CourseName, Cost) VALUES 
("Greek salad", 15.50), 
("Bean soup", 12.25), 
("Pizza", 15.00), 
("Carbonara", 12.50), 
("Kabasa", 17.00), 
("Shwarma", 11.30);

SELECT * FROM Bookings;


#TASK 1

SELECT * FROM Bookings
WHERE BookingDate BETWEEN '2021-11-11' AND '2021-11-13';

#TASK 2

SELECT Bookings.BookingID, Customers.FullName
FROM Bookings
INNER JOIN Customers
ON Bookings.CustomerID = Customers.CustomerID
WHERE BookingDate = '2021-11-11'; 

#TASK 3

SELECT BookingDate, COUNT(BookingDate)
FROM Bookings
GROUP BY BookingDate
ORDER BY COUNT(BookingDate) DESC;

#TASK 4

REPLACE INTO Courses SET Cost = 20.00, CourseName = 'Kabasa';
SELECT * FROM Courses;

#TASK 5

CREATE TABLE DeliveryAdress(
	ID INT PRIMARY KEY,
    Adress VARCHAR(255) NOT NULL,
    Type VARCHAR(50) NOT NULL DEFAULT 'Private',
    CustomerID INT NOT NULL,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

SHOW COLUMNS FROM DeliveryAdress;

#TASK 6

ALTER TABLE Courses ADD COLUMN Ingredients VARCHAR(255);
SHOW COLUMNS FROM Courses;

#TASK 7
SELECT * FROM Bookings;

SELECT FullName From Customers
WHERE (SELECT CustomerID FROM Bookings WHERE Customers.CustomerID = Bookings.CustomerID AND BookingDate = '2021-11-11');

#TASK 8
SELECT * FROM Bookings;

CREATE VIEW BookingsView AS
SELECT BookingID, BookingDate, NumberOfGuests FROM Bookings
WHERE BookingDate < '2021-11-13' AND NumberOfGuests >= 3;

SELECT * FROM BookingsView;

#TASK 9

CREATE PROCEDURE GetBookingsData(InputDate DATE)
SELECT * FROM Bookings
WHERE BookingDate = InputDate;

CALL GetBookingsData('2021-11-13'); 

#TASK 10

SELECT * FROM Bookings;

SELECT CONCAT('ID: ', BookingID, ', Date: ', BookingDate, ', Number of guests: ', NumberOfGuests)
AS 'Booking Details' FROM Bookings;