*Scripting-Extensions
stopScript: scriptDescriptor
	| myScripts script |
	myScripts := self myScripts.
	1 to: myScripts size do:[:i|
		script := myScripts at: i.
		(scriptDescriptor isScriptDescriptorIn: script) ifTrue:[
			script terminateScript.
		].
	].
	"Don't return 'script' since it may not have been the script we stopped"
	^nil