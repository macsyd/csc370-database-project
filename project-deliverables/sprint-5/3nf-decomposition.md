## Prime attributes
Below we list all the prime attributes for each relation currently in our database.

**Users (*UserID*)** <br>
Key(s): UserID <br>
Prime attributes: UserID

**Employees (*UserID*, Name)** <br>
Key(s): UserID <br>
Prime attributes: UserID

**Admins (*UserID*, Name)** <br>
Key(s): UserID <br>
Prime attributes: UserID

**Requests (*RequestID*, CreationDate, RouteName, RouteDescription, Status, CreatedBy, ReviewedBy)** <br>
Key(s): RequestID <br>
Prime attributes: RequestID

**Routes (*Destination*, Gateway, SubnetMask, CreationDate, ExpiryDate, Name, Description, Owner)** <br>
Key(s): Destination <br>
Prime attributes: Destination

## 3NF
Below we determine if our relations are in 3NF.

**Users (*UserID*)** <br>
FDs: None <br>
No FDs, so this relation is in 3NF.

**Employees (*UserID*, Name)** <br>
FDs: UserID &rarr; Name <br>
Left side of this FD is a superkey, so it is in 3NF.

**Admins (*UserID*, Name)** <br>
FDs: UserID &rarr; Name <br>
Left side of FD is a superkey, so it is in 3NF.

**Requests (*RequestID*, CreationDate, RouteName, RouteDescription, Status, CreatedBy, ReviewedBy)** <br>
FDs: RequestID &rarr; CreationDate, RouteName, RouteDescription, Status, CreatedBy, ReviewedBy <br>
Left side of FD is a superkey, so it is in 3NF.

**Routes (*Destination*, Gateway, SubnetMask, CreationDate, ExpiryDate, Name, Description, Owner)** <br>
FDs: Destination &rarr; Gateway, SubnetMask, CreationDate, ExpiryDate, Name, Description, Owner <br>
Left side of FD is a superkey, so it is in 3NF.

Since all FDs in every relation in our current database are in 3NF, this means our database is in 3NF. This makes sense as we previously established that our database in in BCNF, which implies it is in 3NF.

## Preservation of FDs
However, there are two FDs which are present in our ERD but are not preserved in these relations: <br>
RequestID &rarr; Destination <br>
Destination &rarr; RequestID <br>
These FDs come from the one-to-one initiates relationship from our ERD. We could preserve the second FD by including a RequestID attribute in the Routes relation, which would make sense semantically. 
We could preserve the first FD by including a Destination attribute in the Requests relation, which would not make sense as the Destination should not be known yet when a request tuple is created (in the scenario of our database, where an employee would create this request without needing to know the technical details of the route that will be initiated). 
We also cannot implement this relationship by corresponding request and route tuples having the same primary key, as one relation uses an integer as a primary key and one uses a desination IP address. 

In practice, it is likely fine to implement only the second FD by including a RequestID attribute on Routes so that one could determine the request which initiated each route, and if one needed to find the route that was initiated by a particular request one could search the Routes table for the tuple with that RequestID, and since the RequestID attribute in Routes would need to be unique and would therefore by default have an index on it, this query would be relatively fast and would only return one result. However, this is an area that could use some further exploration and possibly improvement to determine the best way to ensure these FDs are preserved in our database.
