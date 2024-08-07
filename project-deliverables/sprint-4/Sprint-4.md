# Sprint 4
## Goals for this sprint
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

**Competency:** *"Enforces consistency: Enforces consistency with check constraints and assertions"* <br>
* Enforce consistency on our database by not allowing the inconsistencies we discovered this sprint to be added to the database. We will measure this using queries that violate our schema which we wrote this sprint (success criteria is 100% of these queries should fail).

## Progress on goals
### Enforcing consistency
This sprint we finished enforcing consistency on our database by adding check constraints to some attributes. Now 100% of the queries we identified last sprint which should fail as they violate the consistency of our database do fail, so this goal has been achieved.

### Inheritance and weak entity sets
We added inheritance to our ERD this sprint as we thought this was a better representation of our entities and relations. We determined that weak entity sets were not required in our ERD and would not add value to our conceptual design.

### Evaluate ERD
We evaluated the quality of our ERD according to the aspects we discussed in lectures and reported our findings in [eval-erd.md](project-deliverables/sprint-4/eval-erd.md). We found that our ERD was of fairly good quality and did not need any additional changes to improve the quality.

### Identify functional dependencies and calculate minimal basis
We identified all functional dependencies in our ERD and reported them in [functional-dependencies.md](project-deliverables/sprint-4/functional-dependencies.md). We then used this list of functional dependencies to determine a minimal basis for our ERD. This is shown in [minimal-basis.md](project-deliverables/sprint-4/minimal-basis.md).

## Goals for next sprint (up to and including Interfacing with an RDBMS)
### Plan to meet module level-competencies
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

## Progress on course-level competencies
**Data Modelling Competency:** *"Constructs well-normalised conceptual and relational schemata that capture requirements without redundancy"* <br>
* This sprint we demonstrated progress on the data modelling competency by identifying dependencies among attributes for entity sets and relations and justifying the quality of a schema through a theoretical lens. We also mapped requirements onto schemata and vice versa to ensure our design was minimal and complete.

**Data Modelling Competency:** *"Applies advanced ERD constructs and normalisation methods to produce more natural schemata"* <br>
* This sprint we demonstrated progress on this data modelling competency by using inheritance and weak entity sets when they are more expressive than alternatives.

**Back-end Engineering Competency:** *"Creates conditions to ensure relational databases exhibit ACID behaviour"* <br>
* We demonstrated progress on this competency by showing we understand the consistency principle and ensuring our database never enters an inconsistent state by adding check constraints to enforece consistency.
