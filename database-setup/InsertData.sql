-- Insert employee data
LOAD DATA INFILE 'C:\Users\sydma\Documents\uvic\summer24\CSC370\csc370-database-project\data\Employee.csv'
INTO TABLE Employee
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


-- Insert admin data
LOAD DATA INFILE 'C:\Users\sydma\Documents\uvic\summer24\CSC370\csc370-database-project\data\Admin.csv'
INTO TABLE Admin
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


-- Insert request data
LOAD DATA INFILE 'C:\Users\sydma\Documents\uvic\summer24\CSC370\csc370-database-project\data\Requests.csv'
INTO TABLE Requests
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


-- Insert route data
LOAD DATA INFILE 'C:\Users\sydma\Documents\uvic\summer24\CSC370\csc370-database-project\data\Routes.csv'
INTO TABLE Routes
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;
