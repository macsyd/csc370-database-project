-- Drop the existing database if it exists
DROP DATABASE IF EXISTS VPNManagement;

-- Create a new database
CREATE DATABASE VPNManagement;

-- Use the new database
USE VPNManagement;

-- Create Users table
CREATE TABLE Employee (
    UserID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) UNIQUE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create the Employee table
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(50) UNIQUE
);

-- Create the Admin table
CREATE TABLE Admin (
    UserID INT PRIMARY KEY,
    AdminName VARCHAR(50) UNIQUE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create the Requests table
CREATE TABLE Requests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    RouteName VARCHAR(100),
    RouteDescription TEXT,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Status` ENUM('APPROVED', 'REJECTED', 'PENDING'),
    CreatedBy INT,
    ReviewedBy INT,
    FOREIGN KEY (ReviewedBy) REFERENCES Admin( UserID),
    FOREIGN KEY (CreatedBy) REFERENCES Employee(UserID)
);

-- Create the Routes table
CREATE TABLE Routes (
    Destination VARCHAR(100) PRIMARY KEY,
    Gateway VARCHAR(100),
    SubnetMask VARCHAR(100),
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ExpiryDate TIMESTAMP,
    `Owner` INT,
    `Name` VARCHAR(100),
    `Description` TEXT,
    FOREIGN KEY (Owner) REFERENCES Employee(UserID)
);

SELECT * FROM Routes;
SELECT * FROM Requests;
SELECT * FROM Admin;
SELECT * FROM Employee
