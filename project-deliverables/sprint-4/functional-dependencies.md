# Functional dependencies in our updated ERD:

## Relation: Employee

Employee.UserID → Employee.Name

## Relation: Admin

Admin.UserID → Admin.Name

## Relation: Request

Request.RequestID → Request.CreationDate
Request.RequestID → Request.Status
Request.RequestID → Request.RouteName
Request.RequestID → Request.RouteDescription
Request.RequestID → Admin.UserID (through Reviews relationship)
Request.RequestID → Admin.Name (through Reviews relationship)
Request.RequestID → Employee.UserID (through Creates relationship)
Request.RequestID → Employee.Name (through Creates relationship)
Request.RequestID → Route.Destination (through Initiates relationship)
Request.RequestID → Route.Gateway (through Initiates relationship)
Request.RequestID → Route.SubnetMask (through Initiates relationship)
Request.RequestID → Route.CreationDate (through Initiates relationship)
Request.RequestID → Route.ExpiryDate (through Initiates relationship)
Request.RequestID → Route.Name (through Initiates relationship)
Request.RequestID → Route.Description (through Initiates relationship)
Request.RequestID → Employee.UserID' (through Initiates and Owns relationships)
Request.RequestID → Employee.Name' (through Initiates and Owns relationships)

## Relation: Route

Route.Destination → Route.Gateway
Route.Destination → Route.SubnetMask
Route.Destination → Route.CreationDate
Route.Destination → Route.ExpiryDate
Route.Destination → Route.Name
Route.Destination → Route.Description
Route.Destination → Employee.UserID (through Owns relationship)
Route.Destination → Employee.Name (through Owns relationship)
Route.Destination → Request.RequestID (through Initiates relationship)
Route.Destination → Request.CreationDate (through Initiates relationship)
Route.Destination → Request.Status (through Initiates relationship)
Route.Destination → Request.RouteName (through Initiates relationship)
Route.Destination → Request.RouteDescription (through Initiates relationship)
Route.Destination → Employee.UserID (through Initiates and Creates relationships)
Route.Destination → Employee.Name (through Initiates and Creates relationships)
Route.Destination → Admin.UserID' (through Initiates and Reviews relationships)
Route.Destination → Admin.Name' (through Initiates and Reviews relationships)
