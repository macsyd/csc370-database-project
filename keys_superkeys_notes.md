+ We have declared \`EmployeeID\` as the `PRIMARY KEY` for the \`Employee\` table because it is a key for the relation; it functionally determines all other attributes in the relation
+ Since we have enforced uniqueness on the \`EmployeeName\` attribute, it is also a key for the relation, so in theory we could have alternatively declared it as the `PRIMARY KEY`
+ The superkeys for this relation are {\`EmployeeID\`}, {\`EmployeeID\`,  \`EmployeeName\`}, and {\`EmployeeName\`}

+ The exact same concepts of the theory apply to the \`Admin\` table, where we declared \`AdminID\` as the `PRIMARY KEY`

+ We declared \`RequestID\` as the `PRIMARY KEY` for the \`Requests\` table because it is the only key for the relation

+ We declared \`RouteID\` as the `PRIMARY KEY` for the \`Routes\` table because it is a key for the relation
+ Alternatively, we could have declared \`Destination\` as the `PRIMARY KEY` because it is also a key (since we already have a `PRIMARY KEY` for this table, we made sure to at least enforce its uniqueness)
+ There are many superkeys in this relation, for example {\`Destination\`, \`Gateway\`, \`SubnetMask\`}
