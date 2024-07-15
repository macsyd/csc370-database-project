# Minimal Basis
We determined a minimal basis for our FD's by inspection.

**Minimal basis of our FD's:** <br>
Employee.UserID &rarr; Employee.Name <br>
Admin.UserID &rarr; Admin.Name <br>
Request.RequestID &rarr; Request.CreationDate <br>
Request.RequestID &rarr; Request.Status <br>
Request.RequestID &rarr; Request.RouteName <br>
Request.RequestID &rarr; Request.RouteDescription <br>
Request.RequestID &rarr; Admin.UserID <br>
Request.RequestID &rarr; Employee.UserID <br>
Request.RequestID &rarr; Route.Destination <br>
Route.Destination &rarr; Route.Gateway <br>
Route.Destination &rarr; Route.SubnetMask <br>
Route.Destination &rarr; Route.CreationDate <br>
Route.Destination &rarr; Route.ExpiryDate <br>
Route.Destination &rarr; Route.Name <br>
Route.Destination &rarr; Route.Description <br>
Route.Destination &rarr; Employee.UserID <br>
Route.Destination &rarr; Request.RequestID 
