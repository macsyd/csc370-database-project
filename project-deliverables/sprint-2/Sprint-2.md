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
This sprint we determined all functional depencencies in our database, and from that determined the superkeys and keys for each relation in our database. This is shown in [keys_superkeys_notes.md](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/keys_superkeys_notes.md).

### Normalization
We investigated whether our database was in Boyce-Codd Normal Form (BCNF) by checking whether each functional dependency in our database had a superkey on the left side of the dependency. We found that this was true for all relations in our database, so it is in BCNF without needing any changes. This is explained in [database_bcnf_eval_notes.md](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/database_bcnf_eval_notes.md).

### Enforce referential integrity
Based on the functional dependencies and keys we determined, we added foreign key constraints to our database ([foreign_keys.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/foreign_keys.sql)). To test the referential integrity, we ran queries on our database, shown in [attempted_anomalies.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/attempted_anomalies.sql), to introduce anomalies into the database and observed that the constraints on our database prevented this from happening. Our foreign key constraints rejected 100% of the attempted anomalies.

### Use aggregation
This sprint we have written demo queries using data aggregation by using the WHERE, HAVING, and GROUP BY operators. These queries are shown in [DemoQueries.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/DemoQueries.sql).

### Use sub-queries
This sprint we have written demo queries using sub-queries, which are shown in [DemoQueries.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/DemoQueries.sql).

## Goals for next sprint (up to and including ACID Transactions)
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


## Progress meeting course-level competencies:
**Data Analytics Competency:** *“Writes SQL code to generate desired effects on a relational database”* <br>
* This sprint we have demonstrated our ability to anticipate the result of queries executed against relation instances, extracted data using selection predicates and attribute projection, and combined data with the JOIN operator as shown in our demo queries (see [DemoQueries.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/DemoQueries.sql)).

**Data Analystics Competency:** *"Massages data into visualisation-ready layouts by slicing, dicing, pivoting, and rolling it up it directly in SQL"* <br>
* This sprint we have demonstrated our ability to express complex logic in a single query using aggregation and sub-queries, shown in our demo queries this sprint (see [DemoQueries.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/DemoQueries.sql)).

**Data Modeling Competency:** *“Constructs well-normalised conceptual and relational schemata that capture requirements without redundancy"* <br>
* This sprint we demonstrated our ability to identify dependencies among attributes and appropriate keys for relations, as shown in [keys_superkeys_notes.md](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/keys_superkeys_notes.md).
* We also demonstrated our ability to eliminate data anomalies with effective normalization by normalizing our database, shown in [database_bcnf_eval_notes.md](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/database_bcnf_eval_notes.md), and preventing data anomalies with foreign key constraints, shown in [attempted_anomalies.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-2/attempted_anomalies.sql).
