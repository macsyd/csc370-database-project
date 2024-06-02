-- Insert employee data
LOAD DATA INFILE 'file path'
INTO TABLE Employee
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


-- Insert admin data
LOAD DATA INFILE 'file path'
INTO TABLE Admin
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


-- Insert request data
LOAD DATA INFILE 'file path'
INTO TABLE Requests
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


-- Insert route data
LOAD DATA INFILE 'file path'
INTO TABLE Routes
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;
