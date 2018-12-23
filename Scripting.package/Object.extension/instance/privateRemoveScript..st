*Scripting-Extensions
privateRemoveScript: aScript
	| scriptList |
	scriptList := self myScripts.
	scriptList := scriptList reject:[:s| s == aScript].
	scriptList isEmpty ifTrue:[scriptList := nil].
	self myScripts: scriptList