*Scripting-Extensions
myScripts: scripts
	scripts
		ifNil:[self myScriptRegistry removeKey: self ifAbsent:[]]
		ifNotNil:[self myScriptRegistry  at: self put: scripts].