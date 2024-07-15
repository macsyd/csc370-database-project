# Minimal Basis
Our group decided that as we had little time left in the sprint and we did not want to spend it calculating the exhaustive closure of our set of functional dependencies (FD's), we decided to determine a minimal basis for our FD's by inspection. This may have resulted in minor errors, but the alternative was not feasible, so we decided this was a better option and would be good enough.


**Minimal basis of our FD's (approximately):** <br>
Employee.UserID &rarr; Employee.Name <br>
Admin.UserID &rarr; Admin.Name <br>
Request.RequestID &rarr; Request.CreationDate, Request.Status, Request.RouteName, Request.RouteDescription, Admin.UserID, Employee.UserID, Route.Destination <br>
Route.Destination &rarr; Route.Gateway, Route.SubnetMask, Route.CreationDate, Route.ExpiryDate, Route.Name, Route.Description, Employee.UserID, Request.RequestID 
