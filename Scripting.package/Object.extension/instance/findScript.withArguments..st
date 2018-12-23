*Scripting-Extensions
findScript: scriptDescriptor withArguments: args
	| myScripts script |
	myScripts := self myScripts.
	1 to: myScripts size do:[:i|
		script := myScripts at: i.
		(scriptDescriptor isScriptDescriptorIn: script) ifTrue:[
			script arguments = args ifTrue:[^script].
		].
	].
	^nil