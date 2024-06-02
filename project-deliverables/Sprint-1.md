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
  - Used for our Users and Admin tables
  - We will be removing the some of the unneeded attributes for our table
- https://www.coderstool.com/fake-test-ipadress-data#google_vignette
  - Used to generate routes for the Route table
- For the Request table we will generate data to correspond with the User and Route tables
  - ie. All routes in the route table will have a corresponding request from the request table that created it
  - ie. Requests that are DENIED will not have a matching route in the route table
  - ie. All request will have UserID and AdminID's that match the ID's in the User and Admin tables
- Attributes such as Dates/TimeStamps, and ID's will be generated in mySQL using the auto_increment and current_timestamp methods

## SQL Database
We have created a [script](https://github.com/macsyd/csc370-database-project/blob/main/VPNManagement.sql) which sets up a MySQL database with tables corresponding to our ERD. The tables are shown here:
![image](https://github.com/macsyd/csc370-database-project/assets/91709747/7520c126-66f2-466f-b74d-51afed35e102)

## Goals for next sprint (up to complex SQL queries):
* 
