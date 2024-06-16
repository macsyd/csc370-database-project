-- Run this to test our referential integrity contraints only after loading the sample data

-- INSERTION ANOMALIES

-- Attempt to insert a tuple into Requests table that has CreatedBy set as an EmployeeID that does not exist in the Employee table:
INSERT INTO `Requests` (`RouteName`, `RouteDescription`, `Status`,  `CreatedBy`, `ReviewedBy`)
VALUES ('Lorem ipsum dolor', 'sit amet, consectetur adipiscing', 'PENDING', 9999, 1);

-- Attempt to insert a tuple into Requests table that has ReviewedBy set as an AdminID that does not exist in Admin table:
INSERT INTO `Requests` (`RouteName`, `RouteDescription`, `Status`,  `CreatedBy`, `ReviewedBy`)
VALUES ('Lorem ipsum dolor', 'sit amet, consectetur adipiscing', 'PENDING', 1, 9999);

-- Attempt to insert a tuple into Routes table that has Owner set as an EmployeeID that does not exist in Employee table:
INSERT INTO `Routes` (`Destination`, `Gateway`, `SubnetMask`, `Owner`, `Name`, `Description`)
VALUES ('24.68.123.111', '24.68.123.1', '255.255.255.0', 9999, 'Lorem ipsum dolor', 'sit amet, consectetur adipiscing');

-- DELETION ANOMALIES

-- Attempt to delete a tuple from Employee table that contains an EmployeeID that is also used for the CreatedBy of at least one tuple in Requests table:
DELETE FROM `Employee`
WHERE `EmployeeID` = 175;

-- Attempt to delete a tuple from Admin table that contains an AdminID that is also used for the ReviewedBy of at least one tuple in Requests table:
DELETE FROM `Admin`
WHERE `AdminID` = 1;

-- Attempt to delete a tuple from Employee table that contains an EmployeeID that is also used for the Owner of at least one tuple in Routes table:
DELETE FROM `Employee`
WHERE `EmployeeID` = 615;

-- UPDATE ANOMALIES

-- Attempt to update a tuple in Requests table to contain an AdminID that does not exist in Admin table:
UPDATE `Requests`
SET `ReviewedBY` = 9999
WHERE `RequestID` = 1;

-- Attempt to update a tuple in Routes table to contain an EmployeeID that does not exist in Employee table:
UPDATE `Routes`
SET `Owner` = 9999
WHERE `RouteID` = 1;

-- Attempt to update a tuple in Employee table to change an EmployeeID that was being used for the CreatedBy of at least one tuple in Requests:
UPDATE `Employee`
SET `EmployeeID` = 9999
WHERE `EmployeeID` = 175;

-- Attempt to update a tuple in Admin table to change an AdminID that was being used for the ReviewedBy of at least one tuple in Requests:
UPDATE `Admin`
SET `AdminID` = 9999
WHERE `AdminID` = 1;

-- Attempt to update a tuple in Employee table to change an EmployeeID that was being used for the Owner of at least once tuple in Routes:
UPDATE `Employee`
SET `EmployeeID` = 9999
WHERE `EmployeeID` = 615;
