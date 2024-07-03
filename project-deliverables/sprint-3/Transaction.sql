SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT * FROM Employee WHERE `EmployeeName` = 'John Doe';
SELECT * FROM Admin WHERE `AdminName` = 'Jane Smith';

START TRANSACTION;

INSERT INTO Admin (AdminName) VALUES ('John Doe');

INSERT INTO Employee (EmployeeName) VALUES ('John Doe');

COMMIT;

SELECT * FROM Employee WHERE `EmployeeName` = 'John Doe';
SELECT * FROM Admin WHERE `AdminName` = 'John Doe';

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

INSERT INTO Employee (EmployeeName) VALUES ('John Doe');

ROLLBACK;

SELECT * FROM Employee WHERE `EmployeeName` = 'John Doe';

-- ****Conditional Update and Rollback*****

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT * FROM Requests WHERE `ReviewedBy` = 1;

UPDATE Requests SET `Status` = 'APPROVED' WHERE ReviewedBy = 1;

SELECT 
    CASE 
        WHEN ROW_COUNT() > 3 THEN 'COMMIT'
        ELSE 'ROLLBACK' -- THIS WAS THE ONLY WAY TO GET IF/THEN STATEMENTS TO WORK
    END INTO @action;

SET @stmt = CONCAT(@action, ';');
PREPARE stmt FROM @stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT * FROM Requests WHERE `ReviewedBy` = 1;

COMMIT;

-- **** Same TRANSACTION just with different values ****

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT * FROM Requests WHERE `ReviewedBy` = 374;

UPDATE Requests SET `Status` = 'APPROVED' WHERE ReviewedBy = 374;

SELECT 
    CASE 
        WHEN ROW_COUNT() > 3 THEN 'COMMIT'
        ELSE 'ROLLBACK'
    END INTO @action;

SET @stmt = CONCAT(@action, ';');
PREPARE stmt FROM @stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT * FROM Requests WHERE `ReviewedBy` = 374;

COMMIT;

