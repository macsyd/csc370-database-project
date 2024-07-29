# Sprint 5
## Goals for this sprint
**Competency:** *"Preserves FD's: Checks if a decomposition preserves FD's and decomposes into third normal form (3NF) when appropriate"* <br>
* Check if all the functional dependencies in our ERD are preserved in our database, which is already in BCNF
* Decompose our database into 3NF if appropriate

**Competency:** *"Preserves MVD's: Checks if a decomposition preserves multi-value dependencies (MVD's) and decomposes into 4NF when appropriate"* <br>
* Check if all multi-valued dependencies are preserved in our database
* Decompose our database into 4NF if appropriate

**Competency:** *"Simplifies queries: Simplifies a complex query by converting a sub-query into a (outer?) join"* <br>
* If possible, simplify our earlier subqueries (in [DemoQueries.sql](project-deliverables/sprint-2/DemoQueries.sql)) by potentially converting them into a join

**Competency:** *"Uses triggers: Enforces consistency by adding triggers to queries"* <br>
* Write queries that use triggers to enforce consistency

**Competency:** *"Embraces ternary logic: Incorporate NULL's into queries with ternary predicate logic"* <br>
* Write queries using NULL values and use ternary predicate logic to predict results

## Progress on goals
### 3NF
We checked all functional dependencies in our database and found the relations in our database were already in 3NF. This is described in [3nf-decomposition.md](project-deliverables/sprint-5/3nf-decomposition.md).

### 4NF
As we have no multi-valued dependencies in our database, we found that our database was already in 4NF and did not require any further decompositions. This is described in [4nf-decomposition.md](project-deliverables/sprint-5/4nf-decomposition.md).

### Simplifying queries
We were able to simplify all three of our subqueries that we wrote back in Sprint 2 by using left outer joins and removing a redundant projection. A new file, [SimplifiedSubqueries.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-5/SimplifiedSubqueries.sql), includes the updated queries as well as the old versions for reference.

### Using triggers
We enhanced our database schema by implementing triggers to ensure that no tuple in the Employees table shares the same UserID as a tuple in the Admins table, and vice versa. You can find the triggers in [Triggers.sql](https://github.com/macsyd/csc370-database-project/blob/main/project-deliverables/sprint-5/Triggers.sql), and our finalized database schema is available in [VPNManagement.sql](https://github.com/macsyd/csc370-database-project/blob/main/database-setup/VPNManagement.sql).

### Queries with NULL values
We created and executed some queries that specifically addressed NULL values, while testing how our database handles conditions that result in TRUE, FALSE, or UNKNOWN due to the NULL values.

## Future work
### Improvements towards meeting module level-competencies
**Competency:** *"Preserves FD's: Checks if a decomposition preserves FD's and decomposes into third normal form (3NF) when appropriate"* <br>
* Further exploration into whether all our FDs are preserved correctly and determine the best way to preserve the initiates relationship between Requests and Routes

**Competency:** *"Utilizes indexing to optimize query performance"* <br>
* Identify common queries that would benefit from indexing and implementing appropriate indexes to optimize performance
* Involves measuring query execution times before and after indexing to ensure that the indexing is worthwhile

**Competency:** *"Applies the external memory model: Analyses look up and range query I/O's in a B+-tree using the I/O model; Converts SQL to plans: Enumerates equivalent logical query plans from a SQL query; Optimises physical queries: Analyse the physical plan efficacy of pushing selections through joins"*<br>
* Analyze existing queries for efficiency using the external memory model and optimize them
* Create common queries that might be run on this database (such as in an application that would use this database) and create optimized query plans for each

### Another improvement
* As part of the Advanced SQL module, we would analyze our database and create appropriate unit tests focused on the functionality of the database to ensure all constraints are satisfied

## Progress on course-level competencies
**Back-end Engineering Competency:** *"Simplifies complex queries for optimized performance"* <br>
* This sprint we focused on simplifying complex queries to improve the performance and readability of our database operations.

**Back-end Engineering Competency** *"Utilizes triggers to automate database operations and enforce business rules"* <br>
* This sprint we advanced this competency by implementing triggers to automate various database operations and enforce business rules.

**Data Modelling Competency:** *""* <br>
