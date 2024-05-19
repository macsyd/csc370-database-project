# Project Kick-Off
## Goals for this sprint:
- Develop a study plan for the course - do this by deciding on our project idea (what we want to build)
- Demonstrate that we can define application and business requirements - do this by creating a list of requirements

## Database system:

### Requirements:
- CRUD: **Create** a route, **read** the list of all routes, **update** a route, **delete** a route
- User must be able to request the **creation** of a route
- **Admin** must be able to review and approve requests (or modify before approval such as filling in missing information)
- Option to add **expiry date** to a route

### Data needed:
- **Destination:** The IP address of the internal service or network that you want to access through the VPN connection.
    - Examples: Web server, file server, database, or a network that all employee PCs and printers are connected to (adding an entire network saves time adding individual IP addresses and might be desired when the IP address could change within that network’s range of IP addresses)
Subnet/Network Mask
- **Gateway:** Usually the IP address of the router.
- Current **route age** and expiration date: An indication of how much time is left before the route is automatically deleted if an expiration date was assigned (helps with technical debt)
- **Owner:** The contact person who is responsible for that device/service (maintainer or just the primary user of it)
- **Name/Description:** What the route is for. Something all employees can comprehend without a technical background.
- **Admin:** which users have admin privileges and what can they access

## Goals for next sprint (covering up to and including Basic Conceptual Design):
- Have a conceptual design of our database, illustrated by an ERD
- Find a source of data to use - open source data online? Create our own example data?
- Have a SQL database set up in our repository with tables

## Reference Ideas

_Some GUI Ideas to help us understand the actions that our database should support as well as the relevant data. However, not all data fields shown in these are totally necessary (the most important are Destination, Mask, and Gateway)._
![CSC 370 projectkickoff](https://github.com/macsyd/csc370-database-project/assets/122244932/6659c1f2-9921-415e-9afe-9e09ce8d54c9)

![Picture2](https://github.com/macsyd/csc370-database-project/assets/122244932/26df7923-9a76-4c35-af94-152217cf6555)

![Picture3](https://github.com/macsyd/csc370-database-project/assets/122244932/b8c872d0-78bc-46af-8fcf-ef0b249a03b7)

![Picture4](https://github.com/macsyd/csc370-database-project/assets/122244932/068e4e74-ba96-4e5a-ba54-45d7b4e8e473)

![Picture5](https://github.com/macsyd/csc370-database-project/assets/122244932/5af00866-8a36-4571-962f-640419799177)
