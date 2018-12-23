exporting
exportProhibited: anObject
	^self error: anObject class name, ' cannot be exported'.