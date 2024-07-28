SELECT UserID, EmployeeName, 
    CASE 
        WHEN EmployeeName IS NULL THEN 'Unknown'
        WHEN EmployeeName IS NOT NULL THEN 'Known'
    END AS NameStatus
FROM Employee;

SELECT R.RouteName, R.Status, A.AdminName
FROM Requests R
INNER JOIN Admin A ON R.ReviewedBy = A.UserID;

SELECT R.RouteName, R.Status, A.AdminName
FROM Requests R
LEFT JOIN Admin A ON R.ReviewedBy = A.UserID;

SELECT * 
FROM Routes 
WHERE ExpiryDate IS NULL 
   OR ExpiryDate > CURRENT_TIMESTAMP;