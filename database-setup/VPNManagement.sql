-- Drop the existing database if it exists
DROP DATABASE IF EXISTS VPNManagement;

-- Create a new database
CREATE DATABASE VPNManagement;

-- Use the new database
USE VPNManagement;

-- Create the Employee table
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(50) UNIQUE
);

-- Create the Admin table
CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    AdminName VARCHAR(50) UNIQUE
);

-- Create the Requests table
CREATE TABLE Requests (
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    RouteName VARCHAR(100),
    Status ENUM('APPROVED', 'DENIED', 'PENDING'),
    RouteDescription TEXT,
    ReviewedBy INT DEFAULT NULL,
    CreatedBy INT,
    FOREIGN KEY (ReviewedBy) REFERENCES Admin(AdminID),
    FOREIGN KEY (CreatedBy) REFERENCES Employee(EmployeeID)
);

-- Create the Routes table
CREATE TABLE Routes (
    RouteID INT AUTO_INCREMENT PRIMARY KEY,
    Destination VARCHAR(100) UNIQUE,
    SubnetMask VARCHAR(100),
    Gateway VARCHAR(100),
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ExpiryDate TIMESTAMP DEFAULT NULL,
    Owner INT,
    Name VARCHAR(100),
    Description TEXT,
    FOREIGN KEY (Owner) REFERENCES Employee(EmployeeID)
);

-- Create database users
CREATE USER 'employee1'@'%' IDENTIFIED BY 'sK244LcP';
CREATE USER 'employee2'@'%' IDENTIFIED BY 'Rkmeoz4h';
CREATE USER 'employee3'@'%' IDENTIFIED BY 'cw3txpLt';
CREATE USER 'admin1'@'%' IDENTIFIED BY 'MbwgpN6z';
CREATE USER 'admin2'@'%' IDENTIFIED BY 'guxL9FTM';
CREATE USER 'admin3'@'%' IDENTIFIED BY 'h9RDymfa';
