accessing
addContact: cc 
	contactsByName at: cc name ifAbsentPut:[ cc ].
	contactsByID at: cc id ifAbsentPut:[ cc ].