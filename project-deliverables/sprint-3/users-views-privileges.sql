-- This script does everything related to users, views, and privileges that is already in VPNManagement.sql, but also includes testing and extra demonstration.

-- Create database users (right now we assume that the number at the end of the username corresponds to the EmployeeID or AdminID)
CREATE USER 'employee1'@'%' IDENTIFIED BY 'sK244LcP';
CREATE USER 'employee2'@'%' IDENTIFIED BY 'Rkmeoz4h';
CREATE USER 'employee3'@'%' IDENTIFIED BY 'cw3txpLt';
CREATE USER 'admin1'@'%' IDENTIFIED BY 'MbwgpN6z';
CREATE USER 'admin2'@'%' IDENTIFIED BY 'guxL9FTM';
CREATE USER 'admin3'@'%' IDENTIFIED BY 'h9RDymfa';

-- Verify that these users now exist
USE `mysql`;
SELECT `User`, `Host` FROM `user` WHERE `User` LIKE 'employee%' OR `User` LIKE 'admin%';
USE `VPNManagement`;

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

-- Grant privileges to employees so that they can view their requests and routes
GRANT SELECT ON `VPNManagement`.`MyRequests`, `VPNManagement`.`MyRoutes`
TO 'employee1'@'%', 'employee2'@'%', 'employee3'@'%';

-- Grant privileges to employees so that they can create requests
GRANT INSERT ON `VPNManagement`.`Requests`
TO 'employee1'@'%', 'employee2'@'%', 'employee3'@'%';
-- Note that the MyRequests view is non-updatable due to the use of the functions in the WHERE clause, so we must grant this privilege on the original table

-- Grant all privileges on all tables to the admins (limited to what the executing user can grant)
GRANT ALL PRIVILEGES ON `VPNManagement`.*
TO 'admin1'@'%', 'admin2'@'%', 'admin3'@'%';

-- Switch users and demonstrate interacting with the views
-- exit
-- mysql -u employee1 -psK244LcP
-- USE `VPNManagement`;
-- SELECT * FROM `MyRequests`;
-- SELECT * FROM `MyRoutes`;
-- INSERT INTO `Requests` (`RouteName`, `RouteDescription`, `CreatedBy`) VALUES ('My Web Server', 'Used for testing.', 1);

-- Executed by an employee, this should fail because only an admin can update a request once it has been created (this is a design choice and is reflected by the privileges granted above):
-- UPDATE `Requests` SET `RouteName` = 'New Name' WHERE `RouteName` = 'My Web Server' AND `CreatedBy` = 1; 

-- However, after switching users to an admin, it will work (as long as the grant privilege statement above was executed by someone who could grant such as privilege):
-- exit
-- mysql -u admin1 -pMbwgpN6z
-- USE `VPNManagement`;
-- UPDATE `Requests` SET `RouteName` = 'New Name' WHERE `RouteName` = 'My Web Server' AND `CreatedBy` = 1; 
