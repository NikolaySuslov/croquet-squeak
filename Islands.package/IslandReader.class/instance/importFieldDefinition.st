importing
importFieldDefinition
	| className fieldName fieldDef |
	className := self importNext.
	fieldName := self importNext.
	fieldDef := (Smalltalk at: className ifAbsent:[^nil]) fieldNamed: fieldName.
	fieldDef ifNil:[self error: 'Where is the field???'].
	^fieldDef