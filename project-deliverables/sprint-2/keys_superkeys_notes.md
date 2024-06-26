# Functional dependencies:

**Table: Employee**
+ EmployeeID → EmployeeName
+ EmployeeName → EmployeeID

**Table: Admin**
+ AdminID → AdminName
+ AdminName → AdminID

**Table: Requests**
+ RequestID → RouteName, RouteDescription, CreationDate, Status, CreatedBy, ReviewBy
+ Note that we can also include any other attributes with RequestID, and that subset will itself be a superkey, therefore, functionally determining all other attributes

**Table: Routes**
+ RouteID → Destination, Gateway, SubnetMask, CreationDate, ExpiryDate, Owner, Name, Description
+ Destination → RouteID, Gateway, SubnetMask, CreationDate, ExpiryDate, Owner, Name, Description
+ Note once again that we can also include any other attributes with RouteID or Destination, and that subset will itself be a superkey, therefore, functionally determining all other attributes

# Keys and superkeys:

**Table: Employee**
+ We have declared \`EmployeeID\` as the `PRIMARY KEY` for the \`Employee\` table because it is a key for the relation; it functionally determines all other attributes in the relation
+ Since we have enforced uniqueness on the \`EmployeeName\` attribute, it is also a key for the relation, so in theory we could have alternatively declared it as the `PRIMARY KEY`
+ The superkeys for this relation are {\`EmployeeID\`}, {\`EmployeeID\`,  \`EmployeeName\`}, and {\`EmployeeName\`}

**Table: Admin**
+ The exact same concepts of the theory apply to the \`Admin\` table, where we declared \`AdminID\` as the `PRIMARY KEY`

**Table: Requests**
+ We declared \`RequestID\` as the `PRIMARY KEY` for the \`Requests\` table because it is the only key for the relation

**Table: Routes**
+ We declared \`RouteID\` as the `PRIMARY KEY` for the \`Routes\` table because it is a key for the relation
+ Alternatively, we could have declared \`Destination\` as the `PRIMARY KEY` because it is also a key (since we already have a `PRIMARY KEY` for this table, we made sure to at least enforce its uniqueness)
+ There are many superkeys in this relation, for example {\`Destination\`, \`Gateway\`, \`SubnetMask\`}
