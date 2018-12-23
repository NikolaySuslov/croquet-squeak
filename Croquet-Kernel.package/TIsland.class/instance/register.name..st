registry
register: anObject name: aName
	| ref |
	true ifTrue:["@@@ Temporary sanity check @@@"
		ref := self lookup: aName ifAbsent:[nil].
		(ref == nil or:[(ref valueOn: self) == anObject]) 
			ifFalse:[self error: 'Duplicate ID'].
	].
	ref := anObject 
		isFarRef ifTrue:[anObject] 
		ifFalse:[self asFarRef: anObject].
	ref myName ifNil:[ref myName: aName].
	mutex critical:[nameMap at: aName put: ref].
	^ref