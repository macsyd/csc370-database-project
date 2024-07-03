-- We have already confirmed in Sprint 2 that our foreign key constraints are both complete and correct, so we will not do that again here.
-- Arguably, all these queries should fail. Therefore, we define the following:
-- PASSED: Query is rejected.
-- FAILED: Query was NOT rejected.

-- Violating constraints on uniqueness:

-- PASSED: Attempt to insert two tuples into the Employee table that have the same EmployeeName.
INSERT INTO `Employee` (`EmployeeName`) VALUES ('Linus Torvalds');
INSERT INTO `Employee` (`EmployeeName`) VALUES ('Linus Torvalds');

-- PASSED: Attempt to insert two tuples into the Admin table that have the same AdminName.
INSERT INTO `Admin` (`AdminName`) VALUES ('Tim Berners-Lee');
INSERT INTO `Admin` (`AdminName`) VALUES ('Tim Berners-Lee');

-- PASSED: Attempt to create two routes with the same Destination.
INSERT INTO `Routes` (`Destination`, `SubnetMask`, `Gateway`, `Owner`, `Name`, `Description`) VALUES ('172.16.123.10', '255.255.255.0', '172.16.123.1', 1, 'RouteA', 'Just for testing.');
INSERT INTO `Routes` (`Destination`, `SubnetMask`, `Gateway`, `Owner`, `Name`, `Description`) VALUES ('172.16.123.10', '255.255.255.0', '172.16.123.1', 1, 'RouteB', 'Just for testing.');


-- Violations of consistency due to lack of constraints:

-- FAILED: Attempt to create a request without specifying a value for CreatedBy. If this is possible, then it means we allow requests to seemingly just appear out of thin air. What if the admin reviewing the request needs more information to understand what the user wants? They have no way of knowing who to contact.
INSERT INTO `Requests` (`RouteName`, `RouteDescription`) VALUES ('RouteC', 'Just for testing.');

-- FAILED: Attempt to create a request without specifying a value for RouteName and RouteDescription. If this is possible, then it means we allow blank requests. That would not make much sense.
INSERT INTO `Requests` (`CreatedBy`) VALUES (1);

-- FAILED: Attempt to create a route without specifying a Destination, SubnetMask, Gateway, or Owner. If any VPN system should be able to work alongside this database, then it is guaranteed to at least require a destination. Would the VPN crash if an entry exists that is missing information? Better to just be safe.
INSERT INTO `Routes` (`Name`, `Description`) VALUES ('Another Route', 'Who knows...');

-- FAILED: Attempt to insert a tuple into the Employee table without specify an EmployeeName.
INSERT INTO `Employee` VALUES ();

-- FAILED: Attempt to insert a tuple into the Admin table without specify an AdminName.
INSERT INTO `Admin` VALUES ();


-- Violating ENUM constraints:

-- PASSED: Attempt to create a request and assign it a Status that does not exist in the enumeration.
INSERT INTO `Requests` (`RouteName`, `Status`, `RouteDescription`, `CreatedBy`) VALUES ('RouteD', 'INVALID_STATUS', 'Just for testing.', 1);


-- Violating timestamps

-- FAILED: Attempt to create a route with a CreationDate that is later than the ExpiryDate
INSERT INTO `Routes` (`Destination`, `SubnetMask`, `Gateway`, `CreationDate`, `ExpiryDate`, `Owner`, `Name`, `Description`) 
VALUES ('172.16.123.11', '255.255.255.0', '172.16.123.1', '2024-07-03 11:01:23', '2024-07-02 11:01:23', 1, 'RouteE', 'Just for testing.');


-- Violating data types

-- PASSED: Attempt to insert a tuple into the Employee table that has an EmployeeID that is a string.
INSERT INTO `Employee` (`EmployeeID`) VALUES ('Invalid ID');

-- PASSED: Attempt to insert a tuple into the Admin table that has an AdminID that is a string.
INSERT INTO `Admin` (`AdminID`) VALUES ('Invalid ID');
