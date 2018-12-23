*Scripting-Extensions
privateAddScript: aScript
	| scriptList |
	aScript receiver == self ifFalse:[^self error:'Not my script'].
	scriptList := self myScripts.
	scriptList size = 0
		ifTrue:[scriptList := Array with: aScript] 
		ifFalse:[scriptList := scriptList copyWith: aScript].
	self myScripts: scriptList