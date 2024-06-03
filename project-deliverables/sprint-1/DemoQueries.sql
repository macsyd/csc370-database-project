-- Find the route name of all requests which have been approved

SELECT `RouteName`
FROM `Requests`
WHERE `Status` = 'APPROVED';


-- Find the names of all admins who have denied a request

SELECT DISTINCT(`AdminName`)
FROM `Admin`
JOIN `Requests`
    ON(`Requests`.`ApprovedBy` = `Admin`.`AdminID`)
WHERE `Requests`.`Status` = 'DENIED';


-- Find names of all employees who own more than 2 routes and how many routes they own

SELECT `EmployeeName`, COUNT(*) AS NumRoutes
FROM `Employee`
JOIN `Routes`
    ON(`Employee`.`EmployeeID` = `Routes`.`Owner`)
GROUP BY `Owner`
HAVING COUNT > 2;