testing
isIgnore 

	^ (level = nil or: [ adapter isNil ]) 
			or: [ adapter isCollection and: [ adapter isEmpty ] ]
 