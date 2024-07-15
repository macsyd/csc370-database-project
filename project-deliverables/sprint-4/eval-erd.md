# Evaluation of ERD Quality
Overall, our ERD was found to be of good quality and did not need any immediate changes besides adding inheritance (this evaluation was conducted on our most up-to-date version of the ERD, including the inheritance changes this sprint).

## Completeness
Based on the requirements we identified in our project kick-off sprint ([Project Kick-Off.md](project-deliverables/project-kick-off/Project Kick-Off.md)), our ERD covers all requirements of our application.

## Correctness
ERD concepts and syntax are used correctly in our ERD.

## Minimality
Our ERD is minimal as removing any attribute, entity, or relationship would result in a loss of data and the ERD would no longer capture all our requirements. Our original list of requirements did not specify how the data should be related in our database and focused more on the application this database would be storing data for, however, our understanding of the requirements of our database has changed as the project has progressed and we believe the current relationships between our data are necessary to store all the required information in a well designed way.

## Expressiveness, Readability, and Self-Explanation
Our ERD is expressive and does not need much extra explanation as each relationship is fairly self-explanatory and can be read off the ERD easily. Our ERD naturally shows each requirement of our database. It is also quite readable as each entity and relationship is laid out in a clear and organized way.

## Extensibility
It is unclear whether our ERD is extensible or not as we have not tried to add any new entities or relationships to it. Our ERD is likely extensible in some ways, as it would be easy to add new relationships differentiated by employees or admins, as they are subsets of users, but it may be hard to extend the ERD in other ways. This could be an area for improvement in the future if we discover ways that our ERD is not extensible, but for now we will not make any changes as we have not found any ways that our ERD is lacking in this area.

## Normality
We determined in Sprint 2 that our database and ERD are in Boyce-Codd Normal Form (BCNF). We have not yet investigated whether our ERD and database are in Third Normal Form (3NF) or Fourth Normal Form (4NF). However, due to the fact that our ERD is in BCNF, we believe our ERD meets this criteria.
