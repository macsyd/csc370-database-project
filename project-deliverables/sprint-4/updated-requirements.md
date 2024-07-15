In the last sprint, while evaluating our database for complete consistency enforcement, we identified areas within our schema that permit data inconsistencies, primarily due to missing requirements. Therefore, we will first refine and expand our list of requirements, and then make the necessary changes to our schema.

## Requirements:

### Administrator actions:
- Administrators must be able to create a route, read the list of all routes, update a route, and delete a route (CRUD)
- Administrators must be able to read the list of all requests, and update a request to fill in any missing information or to assign it an approved/rejected status

### Employee actions:
- Employees must be able to read the list of routes that they are the owner of
- Employees must be able to create requests, and read their list of requests

### Properties of a route:
- A route must automatically become inactive on its expiry date
- The expiry date must be later than the creation date
- Every route must contain at least a destination, subnet mask, gateway, and an owner

### Properties of a request:
- Every request must contain at least a name, description, and the identifier of the employee who created it
