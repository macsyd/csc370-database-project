-- Drop the existing database if it exists
DROP DATABASE IF EXISTS VPNManagement;

-- Create a new database
CREATE DATABASE VPNManagement;

-- Use the new database
USE VPNManagement;

-- Create the Users table
CREATE TABLE Users (
	UserID INT AUTO_INCREMENT PRIMARY KEY
);

-- Create the Employees table
CREATE TABLE Employees (
	UserID INT PRIMARY KEY,
	`Name` VARCHAR(50) NOT NULL,
	FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create the Admins table
CREATE TABLE Admins (
	UserID INT PRIMARY KEY,
	`Name` VARCHAR(50) NOT NULL,
	FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create the Requests table
CREATE TABLE Requests (
	RequestID INT AUTO_INCREMENT PRIMARY KEY,
	RouteName VARCHAR(100) NOT NULL,
	RouteDescription TEXT NOT NULL,
	CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Status ENUM('APPROVED', 'REJECTED', 'PENDING') DEFAULT 'PENDING',
	CreatedBy INT NOT NULL,
	ReviewedBy INT,
	FOREIGN KEY (ReviewedBy) REFERENCES Admins(UserID),
	FOREIGN KEY (CreatedBy) REFERENCES Employees(UserID)
);

-- Create the Routes table
CREATE TABLE Routes (
	Destination VARCHAR(100) PRIMARY KEY,
	Gateway VARCHAR(100) NOT NULL,
	SubnetMask VARCHAR(100) NOT NULL,
	CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	ExpiryDate TIMESTAMP,
	Owner INT NOT NULL,
	`Name` VARCHAR(100),
	Description TEXT,
	FOREIGN KEY (Owner) REFERENCES Employees(UserID),
	CHECK (CreationDate < ExpiryDate)
);

-- Create triggers to prevent duplicate UserIDs

DELIMITER $$

CREATE TRIGGER employee_userid_check_insert
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM Admins WHERE UserID = NEW.UserID) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'UserID already exists in Admins table';
	END IF;
END $$

CREATE TRIGGER employee_userid_check_update
BEFORE UPDATE ON Employees
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM Admins WHERE UserID = NEW.UserID) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'UserID already exists in Admins table';
	END IF;
END $$

CREATE TRIGGER admin_userid_check_insert
BEFORE INSERT ON Admins
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM Employees WHERE UserID = NEW.UserID) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'UserID already exists in Employees table';
	END IF;
END $$

CREATE TRIGGER admin_userid_check_update
BEFORE UPDATE ON Admins
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM Employees WHERE UserID = NEW.UserID) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'UserID already exists in Employees table';
	END IF;
END $$

DELIMITER ;
