ownership
getOwnedObject: id

	id = objectID ifTrue:[^self].
ownedObjects ifNil:[^nil].
	^ id ifNotNil:[ownedObjects at:id ifAbsent:[nil]] ifNil:[nil].