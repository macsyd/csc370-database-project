# Sprint 3
## Goals for this sprint
### Plan to meet module-level competencies:
**Competency:** *“Manages access: Manages data access with users for whom privileges are set and revoked”* <br>
* Add example users to our database and manage their access by giving them specific privileges.
* Attempt to run queries that the user does not have privileges for and observe how our database prevents this from happening (success criteria is 100% of these queries should fail).

**Competency:** *"Creates views: Creates a view with privileges and inserts or deletes from base table"* <br>
* Create views within our database.

**Competency:** *"Ensures atomicity: Ensures atomicity by batching queries into transactions"* <br>
* Write transactions that batch queries together.

**Competency:** *"Enforces consistency: Enforces consistency with check constraints and assertions"* <br>
* Enforce consistency on our database and attempt to run queries that violate our schema to observe how well our database handles this (success criteria is 100% of these queries should fail).

**Competency:** *"Isolates transactions: Analyses transactions to determine and set appropriate isolation levels"* <br>
* Write transactions and analyze them to determine the isolation levels which are appropriate
* Manually set isolation levels in our database

## Progress on goals this sprint
### Manage access
This sprint, we created new database users and gave them specific access permissions to test permissions in our database. We tested these permissions by attempting to execute queries that these users did not have permissions for and all of these queries failed, so our goal of 100% of queries without proper permissions failing was achieved.

### Create views
This sprint we created some views in our database and executed queries on them, as shown in [users-views-privileges.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-3/user-views-privileges.sql).

### Ensure atomicity
This sprint we created transactions, shown in [Transaction.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-3/Transaction.sql), which batch queries together to demonstrate atomicity within our database.

### Enforce consistency
This sprint we created queries, shown in [consistency-eval.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-3/consistency-eval.sql), that would introduce data inconsistencies to our database. Our goal was for 100% of these queries to fail, but only 50% of them did. This was more consistency violations than we expected to find, so we did not have enough time this sprint to fix these inconsistencies as each group member was busy with midterms.

### Isolate transactions
In the transactions we wrote for this sprint, we analyzed the transaction to determine which isolation level was most appropriate for each and then set the isolation levels for each transaction, which is shown in [Transaction.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-3/Transaction.sql).

## Goals for next sprint (up to and including the first two lessons of Advanced Relational Design)
### Plan to meet module-level competencies:
**Competency:** *"Uses inheritance notions: Incorporates inheritance and weak entity sets into database design"* <br>
* Add inheritance and weak entity sets to our ERD and implement those changes in our database by updating or adding tables where necessary

**Competency:** *"Evaluates quality: Evaluates an ERD with respect to a canonical set of design principles"* <br>
* Assess quality of our ERD according to the methods and principles discussed in class
* Report quality of our ERD according to these standards
* Update our ERD to improve quality if applicable

**Competency:** *"Connects conceptual-logical: Reads FD's out of an ERD and reverse engineers relations to an ERD"* <br>
* Identify all FD's in our updated ERD and ensure they are implemented in our database

**Competency:** *"Simplifies FD's: Calculates a minimal basis for a set of FD's to ensure design simplicity"* <br>
* Calculate minimal basis for the set of FD's in our ERD/database
* If the set of FD's in our ERD is not a minimal basis, simplify it to be one

**Competency:** *"Preserves FD's: Checks if a decomposition preserves FD's and decomposes into third normal form (3NF) when appropriate"* <br>
* As this competency has not been covered in lectures as of this sprint's submission, we will cover this competency in the next sprint

**Competency:** *"Preserves MVD's: Checks if a decomposition preserves multi-value dependencies (MVD's) and decomposes into 4NF when appropriate"* <br>
* As this competency has not been covered in lectures as of this sprint's submission, we will cover this competency in the next sprint

**Competency:** *"Enforces consistency: Enforces consistency with check constraints and assertions"* <br>
* Enforce consistency on our database by not allowing the inconsistencies we discovered this sprint to be added to the database. We will measure this using queries that violate our schema which we wrote this sprint (success criteria is 100% of these queries should fail).

## Progress meeting course-level competencies:
**Back-End Engineering Competency:** *“Creates conditions to ensure relational databases exhibit ACID behaviour”* <br>
* This sprint we showcased this competency by writing transactions and understanding consistency.

**Back-End Engineering Competency:** *“Implements effective controls to ensure that a database can be used in a concurrent, multi-user environment”* <br>
* This sprint we demonstrated this competency by creating database users and giving them privileges, creating views to regulate data access by these users, and selecting isolation levels for trasactions.
