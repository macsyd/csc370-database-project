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
