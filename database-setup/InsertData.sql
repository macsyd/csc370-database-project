-- Insert user data
LOAD DATA LOCAL INFILE '/path/to/Users.csv'
INTO TABLE Users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Insert employee data
LOAD DATA LOCAL INFILE '/path/to/Employees.csv'
INTO TABLE Employees
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Insert admin data
LOAD DATA LOCAL INFILE '/path/to/Admins.csv'
INTO TABLE Admins
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Insert request data
LOAD DATA LOCAL INFILE '/path/to/Requests.csv'
INTO TABLE Requests
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
SET ReviewedBy = NULLIF(ReviewedBy, '');

-- Insert route data
LOAD DATA LOCAL INFILE '/path/to/Routes.csv'
INTO TABLE Routes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
