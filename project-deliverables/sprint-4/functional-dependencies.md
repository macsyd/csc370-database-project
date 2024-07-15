# Functional dependencies in our updated ERD:

## Relation: Employee

Employee.UserID → Employee.Name

## Relation: Admin

Admin.UserID → Admin.Name

## Relation: Request

Request.RequestID → Request.CreationDate<br>
Request.RequestID → Request.Status<br>
Request.RequestID → Request.RouteName<br>
Request.RequestID → Request.RouteDescription<br>
Request.RequestID → Admin.UserID (through Reviews relationship)<br>
Request.RequestID → Admin.Name (through Reviews relationship)<br>
Request.RequestID → Employee.UserID (through Creates relationship)<br>
Request.RequestID → Employee.Name (through Creates relationship)<br>
Request.RequestID → Route.Destination (through Initiates relationship)<br>
Request.RequestID → Route.Gateway (through Initiates relationship)<br>
Request.RequestID → Route.SubnetMask (through Initiates relationship)<br>
Request.RequestID → Route.CreationDate (through Initiates relationship)<br>
Request.RequestID → Route.ExpiryDate (through Initiates relationship)<br>
Request.RequestID → Route.Name (through Initiates relationship)<br>
Request.RequestID → Route.Description (through Initiates relationship)<br>
Request.RequestID → Employee.UserID' (through Initiates and Owns relationships)<br>
Request.RequestID → Employee.Name' (through Initiates and Owns relationships)

## Relation: Route

Route.Destination → Route.Gateway<br>
Route.Destination → Route.SubnetMask<br>
Route.Destination → Route.CreationDate<br>
Route.Destination → Route.ExpiryDate<br>
Route.Destination → Route.Name<br>
Route.Destination → Route.Description<br>
Route.Destination → Employee.UserID (through Owns relationship)<br>
Route.Destination → Employee.Name (through Owns relationship)<br>
Route.Destination → Request.RequestID (through Initiates relationship)<br>
Route.Destination → Request.CreationDate (through Initiates relationship)<br>
Route.Destination → Request.Status (through Initiates relationship)<br>
Route.Destination → Request.RouteName (through Initiates relationship)<br>
Route.Destination → Request.RouteDescription (through Initiates relationship)<br>
Route.Destination → Employee.UserID (through Initiates and Creates relationships)<br>
Route.Destination → Employee.Name (through Initiates and Creates relationships)<br>
Route.Destination → Admin.UserID' (through Initiates and Reviews relationships)<br>
Route.Destination → Admin.Name' (through Initiates and Reviews relationships)
