# Sprint 1
## Goals for this sprint:
* Have a conceptual design of our database, illustrated by an ERD
* Find a source of data to use - open source data online? Create our own example data?
* Have a SQL database set up in our repository with tables

## ERD
ERD for our VPN Route Management System:
![image](https://github.com/macsyd/csc370-database-project/assets/91709747/0cffcc81-5e2d-4491-89d9-3666f121a2fa)
The actual ERD file can be viewed on [draw.io](draw.io) by selecting GitHub as the storage and selecting this repo and diagram.

## Data Source
For our data source we will be using data from the following:

- https://www.datablist.com/learn/csv/download-sample-csv-files
  - Used the 'People' table for our Employee table
  - We will be removing the some of the unnecessary attributes for our table
- https://www.coderstool.com/fake-test-ipadress-data#google_vignette
  - Used to generate routes for the Route table
- For the Request table we will generate data to correspond with the User and Route tables
  - ie. All routes in the route table will have a corresponding request from the request table that created it
  - ie. Requests that are DENIED will not have a matching route in the route table
  - ie. All request will have UserID and AdminID's that match the ID's in the User and Admin tables
- https://fakery.dev/ 
  - Used to generate route names, route descriptions, and dates for routes (for both Request and Route tables)
  - Used to generate names for the Admin table
- The rest of the data was generated using R
  - Randomly assigned values of "APPROVED", "REJECTED" AND "PENDING" to requests' status in Request table
  - Randomly assigned employee and admin IDs to requests' CreatedBy and ReviewedBy attributes
  - Added all request route names and descriptions with an approved status to the routes table

## SQL Database
We have created a [script](https://github.com/macsyd/csc370-database-project/blob/main/VPNManagement.sql) which sets up a MySQL database with tables corresponding to our ERD. The tables are shown here:
![image](https://github.com/macsyd/csc370-database-project/assets/91709747/7520c126-66f2-466f-b74d-51afed35e102)

## Goals for next sprint (up to complex SQL queries):
### Plan to meet module-level competencies:
**Competency:** *“Determines keys: Determines an appropriate set of FD's for a relation and determines keys”* <br>
+ Determine functional dependencies and keys (including keys and superkeys)

**Competency:** *“BCNF-normalises relations: Prevents data anomalies by decomposing simple relations into BCNF”* <br>
+ Investigate whether our database is in BCNF by checking for BCNF violations and making changes as needed

**Competency:** *“Enforces referential integrity: Adds foreign keys with specific referential integrity constraints and policies”* <br>
+ Add foreign key constraints to our database
+ Attempt to create data anomalies and observe how well our database prevents them from occurring (success criteria is 100% of attempted data anomalies rejected)

**Competency:** *“Uses aggregation: Creates an aggregation query with FD attributes and both WHERE and HAVING”* <br>
+ Write aggregation queries using WHERE and HAVING
+ Write queries using GROUP BY

**Competency:** *“Uses sub-queries: Creates a sub-query to aggregate aggregations with existential condition”* <br>
+ Write subqueries

## Progress meeting course-level competencies:
**Data Analytics Competency:** *“Writes SQL code to generate desired effects on a relational database”* <br>
+ In the process of writing SQL queries to extract specific data from our database, we have showcased the ability to anticipate the result of queries executed against the relation instances (see DemoQueries.sql)
+ We have demonstrated the ability write SQL queries to combine data from tables using JOIN operations (see DemoQueries.sql)

**Data Modeling Competency:** *“Stores data in a set of tables that are compatible with data sources”* <br>
+ As we set up the beginnings of our SQL database, we demonstrated the ability to select appropriate data types for tables (see VPNManagement.sql)
+ Through developing our ERD following the guidelines discussed in lecture, we have showcased the ability to document relationships between tables in a way that is syntactically and semantically correct (see above)
