--example query
--joins 'Requests' and 'Employee' and shows the name of 'admin' or 'employee' instead of the corresponding ID
SELECT r.RequestID, r.RouteName, r.RouteDescription, r.CreationDate, r.Status, 
       e.EmployeeName AS CreatedByName, a.AdminName AS ReviewedByName
FROM Requests r
JOIN Employee e ON r.CreatedBy = e.EmployeeID
LEFT JOIN Admin a ON r.ReviewedBy = a.AdminID
LIMIT 10;

--AGGREGATION QUERIES
--get from 'Routes' the earliest and latest create date
SELECT MIN(CreationDate) AS EarliestCreationDate, MAX(CreationDate) AS LatestCreationDate
FROM Routes;
--if you want to see the corresponding tuple(s)
SELECT r.*
FROM Routes r
WHERE r.CreationDate = (SELECT MIN(CreationDate) FROM Routes)
   OR r.CreationDate = (SELECT MAX(CreationDate) FROM Routes);

--get number of requests from 'Requests' by status
SELECT Status, COUNT(*) AS NumberOfRequests
FROM Requests
GROUP BY Status;
--or if you only want the number of APPROVED
SELECT COUNT(*) AS ApprovedRequests
FROM Requests
WHERE Status = 'APPROVED';

--give list of admin who have reviewed more than count number of requests
SELECT IFNULL(ReviewedBy, 0) AS ReviewedBy, COUNT(*) AS NumberOfRequestsReviewed
FROM Requests
WHERE ReviewedBy IS NOT NULL
GROUP BY ReviewedBy
HAVING COUNT(*) > 10
OR ReviewedBy = 0;

--number of unreviewed 
--for us it is 1000 because there are 1000 with status PENDING
SELECT COUNT(*) AS NumberOfUnreviewedRequests
FROM Requests
WHERE ReviewedBy IS NULL;

-- Get all requests that were reviewed by the admin with ID 175 (was used while troubleshooting and testing)
SELECT * FROM `Requests` WHERE `CreatedBy` = 175;

-- Get all routes that are owned by employee with ID 615 (was used while troubleshooting and testing)
SELECT * FROM `Routes` WHERE `Owner` = 615;

--QUERIES WITH SUBQUERIES
--get employees that have not created requests and order by EmployeeID
SELECT *
FROM Employee e
WHERE e.EmployeeID NOT IN (
    SELECT DISTINCT CreatedBy
    FROM Requests
)
ORDER BY e.EmployeeID;

--get number of unreviewed requests by status
--ALL OF OUR UNREVIEWED ARE PENDING
SELECT Status, NumberOfUnreviewedRequests
FROM (
    SELECT Status, COUNT(*) AS NumberOfUnreviewedRequests
    FROM Requests
    WHERE ReviewedBy IS NULL
    GROUP BY Status
) AS subquery;

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
