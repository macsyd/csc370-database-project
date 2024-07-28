-- Create triggers to prevent duplicate UserIDs

DELIMITER $$

CREATE TRIGGER employee_userid_check_insert
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM Admins WHERE UserID = NEW.UserID) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'UserID already exists in Admins table';
	END IF;
END $$

CREATE TRIGGER employee_userid_check_update
BEFORE UPDATE ON Employees
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM Admins WHERE UserID = NEW.UserID) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'UserID already exists in Admins table';
	END IF;
END $$

CREATE TRIGGER admin_userid_check_insert
BEFORE INSERT ON Admins
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM Employees WHERE UserID = NEW.UserID) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'UserID already exists in Employees table';
	END IF;
END $$

CREATE TRIGGER admin_userid_check_update
BEFORE UPDATE ON Admins
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT * FROM Employees WHERE UserID = NEW.UserID) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'UserID already exists in Employees table';
	END IF;
END $$

DELIMITER ;
