importing
importMethodTrigger
	| className selector trigger |
	className := self importNext.
	selector := self importNext.
	trigger := (Smalltalk at: className ifAbsent:[^nil]) methodTriggerAt: selector.
	trigger ifNil:[self error: 'Where is the trigger???'].
	^trigger