/* OLD
SELECT *
FROM Employee e
WHERE e.EmployeeID NOT IN (
    SELECT DISTINCT CreatedBy
    FROM Requests
)
ORDER BY e.EmployeeID;
*/

-- NEW
SELECT `Employees`.`UserID`, `Employees`.`Name`
FROM `Employees`
LEFT OUTER JOIN `Requests`
  ON (`Employees`.`UserID` = `Requests`.`CreatedBy`)
WHERE `Requests`.`CreatedBy` IS NULL
ORDER BY UserID;
-- Note: We have a NOT NULL constraint on `Requests`.`CreatedBy` in our schema, so we are safe in that this will not cause spurious results.


/* OLD
SELECT Status, NumberOfUnreviewedRequests
FROM (
    SELECT Status, COUNT(*) AS NumberOfUnreviewedRequests
    FROM Requests
    WHERE ReviewedBy IS NULL
    GROUP BY Status
) AS subquery;
*/

-- NEW
SELECT `Status`, COUNT(*) AS `NumberOfUnreviewedRequests`
FROM `Requests`
WHERE `ReviewedBy` IS NULL
GROUP BY `Status`;


/* OLD
-- Get requests that were reviewed by an admin not found in the admin table
-- This was used while troubleshooting issues with our data and foreign key constraints
SELECT DISTINCT `ReviewedBy`, `RequestID` 
FROM `Requests` 
WHERE `ReviewedBy` IS NOT NULL 
AND `ReviewedBy` NOT IN 
(
	SELECT `AdminID` 
	FROM `Admin`
);
*/

-- NEW
SELECT DISTINCT `ReviewedBy`, `RequestID` 
FROM `Requests` 
LEFT OUTER JOIN `Admins`
  ON (`Requests`.`ReviewedBy` = `Admins`.`UserID`)
WHERE `Admins`.`UserID` IS NULL
AND `ReviewedBy` IS NOT NULL;
-- Note: We have `Admins`.`UserID` set as a primary key in our schema, so it cannot be NULL and we are safe in that this will not cause spurious results.
