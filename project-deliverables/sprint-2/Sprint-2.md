# Sprint 2
## Feedback from last sprint
Last sprint we created an ERD to visualize the conceptual design of our database. While we included arrows indicating multiplicity in our diagram, we did not mention them in our video. Below is our ERD and an explanation of the mulitplicity of each relationship.
![image](https://github.com/macsyd/csc370-database-project/assets/91709747/0cffcc81-5e2d-4491-89d9-3666f121a2fa)

* A route is owned by one employee, and an employee can own many routes (many-to-one relationship)
* A request is created by one employee, and an employee can create many requests (many-to-one relationship)
* A request is reviewed by one admin, and an admin can review many requests (many-to-one relationship)
* One request can initiate a route, and each route can only be initiated by one request (one-to-one relationship)

## Goals for this sprint
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

## Progress on goals this sprint
### Determine keys

### Normalization

### Enforce referential integrity
*maybe we should demo this part with our DB*

### Use aggregation
*demo queries*

### Use sub-queries
*demo queries*

## Goals for next sprint (up to and including ACID Transactions)

## Progress meeting course-level competencies:
**Data Analytics Competency:** *“Writes SQL code to generate desired effects on a relational database”* <br>

**Data Modeling Competency:** *“Stores data in a set of tables that are compatible with data sources”* <br>
