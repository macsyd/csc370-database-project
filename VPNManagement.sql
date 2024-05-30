-- Drop existing database if it exists
DROP DATABASE IF EXISTS VPNManagement;

-- Create a new database
CREATE DATABASE VPNManagement;

-- Use the new database
USE VPNManagement;

-- Create Users table
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(50) UNIQUE
);

CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    AdminName VARCHAR(50) UNIQUE
);

CREATE TABLE Requests (
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    RouteName VARCHAR(100),
    Status ENUM('APPROVED', 'DENIED', 'PENDING'),
    RouteDescription TEXT,
    ApprovedBy INT,
    CreatedBy INT,
    FOREIGN KEY (ApprovedBy) REFERENCES Admin(AdminID),
    FOREIGN KEY (CreatedBy) REFERENCES Employee(EmployeeID)
);

-- Create Routes table
CREATE TABLE Routes (
    RouteID INT AUTO_INCREMENT PRIMARY KEY,
    Destination VARCHAR(100) UNIQUE,
    SubnetMask VARCHAR(100),
    Gateway VARCHAR(100),
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ExpiryDate TIMESTAMP,
    Owner INT,
    Name VARCHAR(100),
    Description TEXT,
    Initiated INT,
    FOREIGN KEY (Owner) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (Initiated) REFERENCES Requests(RequestID)
);
INSERT INTO Employee (EmployeeName) VALUES
('John Doe');

-- Insert data into Admin table
INSERT INTO Admin (AdminName) VALUES
('Jane Smith');

-- Insert data into Requests table
INSERT INTO Requests (RouteName, Status, RouteDescription, ApprovedBy, CreatedBy) VALUES
('Office Network Access', 'APPROVED', 'Access to the office network for all employees.', 1, 1);

-- Insert data into Routes table
INSERT INTO Routes (Destination, SubnetMask, Gateway, ExpiryDate, Owner, Name, Description, Initiated) VALUES
('192.168.1.0', '255.255.255.0', '192.168.1.1', '2024-12-31 23:59:59', 1, 'Office Network', 'Access to office network resources', 1);


SELECT * FROM Routes;
SELECT * FROM Requests;
SELECT * FROM Admin;
SELECT * FROM Employee