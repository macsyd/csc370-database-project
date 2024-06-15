-- Run this to test our referential integrity contraints only after loading the sample data

-- INSERTION ANOMALIES

-- Attempt to insert a tuple into Requests table that was created by an EmployeeID that doesn't exist in the Employee table:
INSERT INTO `Requests` (`RouteName`, `RouteDescription`, `Status`,  `CreatedBy`, `ReviewedBy`)
VALUES ('Lorem ipsum dolor', 'sit amet, consectetur adipiscing', 'PENDING', 9999, 1);

-- Attempt to insert a tuple into Requests table that was reviewed by an AdminID that doesn't exist in Admin table:
INSERT INTO `Requests` (`RouteName`, `RouteDescription`, `Status`,  `CreatedBy`, `ReviewedBy`)
VALUES ('Lorem ipsum dolor', 'sit amet, consectetur adipiscing', 'PENDING', 1, 9999);

-- Attempt to insert a tuple into Routes table that is owned by an EmployeeID that doesn't exist in Employee table:
INSERT INTO `Routes` (`Destination`, ` Gateway`, ` SubnetMask`, `Owner`, ` Name`, ` Description`)
VALUES ('24.68.123.111', '24.68.123.1', '255.255.255.0', 9999, 'Lorem ipsum dolor', 'sit amet, consectetur adipiscing');

-- DELETION ANOMALIES

-- Attempt to delete a tuple from Employee table that contains an EmployeeID used as the owner of at least one route:
DELETE FROM `Employee`
WHERE `EmployeeID` = 615;

-- Attempt to delete a tuple from Employee table that contains an EmployeeID used as the creator of at least one request:
DELETE FROM `Employee`
WHERE `EmployeeID` = 175;

-- Attempt to delete a tuple from Admin table that contains an AdminID used as the reviewer of at least one request:
DELETE FROM `Admin`
WHERE `AdminID` = 1;
