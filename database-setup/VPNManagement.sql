-- Drop the existing database if it exists
DROP DATABASE IF EXISTS VPNManagement;

-- Create a new database
CREATE DATABASE VPNManagement;

-- Use the new database
USE VPNManagement;

-- Create the Employee table
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(50) UNIQUE NOT NULL
);

-- Create the Admin table
CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    AdminName VARCHAR(50) UNIQUE NOT NULL
);

-- Create the Requests table
CREATE TABLE Requests (
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    RouteName VARCHAR(100) NOT NULL,
    Status ENUM('APPROVED', 'DENIED', 'PENDING') DEFAULT 'PENDING',
    RouteDescription TEXT NOT NULL,
    ReviewedBy INT,
    CreatedBy INT NOT NULL,
    FOREIGN KEY (ReviewedBy) REFERENCES Admin(AdminID),
    FOREIGN KEY (CreatedBy) REFERENCES Employee(EmployeeID)
);

-- Create the Routes table
CREATE TABLE Routes (
    RouteID INT AUTO_INCREMENT PRIMARY KEY,
    Destination VARCHAR(100) UNIQUE NOT NULL,
    SubnetMask VARCHAR(100) NOT NULL,
    Gateway VARCHAR(100) NOT NULL,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ExpiryDate TIMESTAMP,
    Owner INT NOT NULL,
    Name VARCHAR(100),
    Description TEXT,
    FOREIGN KEY (Owner) REFERENCES Employee(EmployeeID)
);

-- Create database users (right now we assume that the number at the end of the username corresponds to the EmployeeID or AdminID)
CREATE USER 'employee1'@'%' IDENTIFIED BY 'sK244LcP';
CREATE USER 'employee2'@'%' IDENTIFIED BY 'Rkmeoz4h';
CREATE USER 'employee3'@'%' IDENTIFIED BY 'cw3txpLt';
CREATE USER 'admin1'@'%' IDENTIFIED BY 'MbwgpN6z';
CREATE USER 'admin2'@'%' IDENTIFIED BY 'guxL9FTM';
CREATE USER 'admin3'@'%' IDENTIFIED BY 'h9RDymfa';

-- Create a view that contains all tuples from the Requests table that were created by the user
CREATE VIEW `MyRequests` AS
SELECT * 
FROM `Requests`
WHERE `CreatedBy` = CAST(REGEXP_REPLACE(SUBSTRING_INDEX(USER(), '@', 1), '[^0-9]', '') AS UNSIGNED);

-- Create a view that contains all tuples from the Routes table that are owned by the user
CREATE VIEW `MyRoutes` AS
SELECT *
FROM `Routes`
WHERE `Owner` = CAST(REGEXP_REPLACE(SUBSTRING_INDEX(USER(), '@', 1), '[^0-9]', '') AS UNSIGNED);

-- Grant privileges to employees so that they can view their requests
GRANT SELECT ON `VPNManagement`.`MyRequests`
TO 'employee1'@'%', 'employee2'@'%', 'employee3'@'%';

-- Grant privileges to employees so that they can view their routes
GRANT SELECT ON `VPNManagement`.`MyRoutes`
TO 'employee1'@'%', 'employee2'@'%', 'employee3'@'%';

-- Grant privileges to employees so that they can create requests
GRANT INSERT ON `VPNManagement`.`Requests`
TO 'employee1'@'%', 'employee2'@'%', 'employee3'@'%';
-- Note that the MyRequests view is non-updatable due to the use of the functions in the WHERE clause, so we must grant this privilege on the original table

-- Grant all privileges on all tables to the admins (limited to what the executing user can grant)
GRANT ALL PRIVILEGES ON `VPNManagement`.*
TO 'admin1'@'%', 'admin2'@'%', 'admin3'@'%';
