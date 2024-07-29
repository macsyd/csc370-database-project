# Sprint 5
## Goals for this sprint
**Competency:** *"Preserves FD's: Checks if a decomposition preserves FD's and decomposes into third normal form (3NF) when appropriate"* <br>
* Check if all the functional dependencies in our ERD are preserved in our database which is in BCNF
* Decompose our database into 3NF if appropriate

**Competency:** *"Preserves MVD's: Checks if a decomposition preserves multi-value dependencies (MVD's) and decomposes into 4NF when appropriate"* <br>
* Check if all multi-valued dependencies are preserved in our database
* Decompose our database into 4NF if appropriate

**Competency:** *"Simplifies queries: Simplifies a complex query by converting a sub-query into a (outer?) join"* <br>
* If possible, simplify our earlier queries (in [DemoQueries.sql](project-deliverables/sprint-2/DemoQueries.sql)) that used sub-queries by potentially converting them into a join

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

### Using triggers

### Queries with NULL values
One Focus this sprint was incorporating NULL values into our database to understand and utilize ternary predicate logic. We created and executed some queries that specifically addressed NULL values, and tested how our database handles conditions that result in TRUE, FALSE, or UNKNOWN due to the NULLs values.

## Future Work
### Improvement to meet module level-competencies
**Competency:** *"Preserves FD's: Checks if a decomposition preserves FD's and decomposes into third normal form (3NF) when appropriate"* <br>
* Further exploration into whether all our FDs are preserved correctly and determine the best way to preserve the initiates relationship between Requests and Routes.

**Competency:** *"Utilizes indexing to optimize query performance"* <br>
* Future work will involve identifying critical queries that would benefit from indexing and implementing appropriate indexes to optimize performance. We will measure query execution times before and after indexing to ensure significant improvements.

## Progress on course-level competencies
**Back-end Engineering Competency:** *"Simplifies complex queries for optimized performance"* <br>
* This sprint we focused on simplifying complex queries to improve the performance and readability of our database operations.

**Back-end Engineering Competency** *"Utilizes triggers to automate database operations and enforce business rules"* <br>
* This sprint we advanced this competency by implementing triggers to automate various database operations and enforce business rules.

**Data Modelling Competency:** *""* <br>

**Back-end Engineering Competency:** *""* <br>
