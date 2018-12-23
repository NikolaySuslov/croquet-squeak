*Scripting-Extensions
runScript: aScriptDescriptor when: aTrigger
"Evaluate the given script whenever the trigger becomes active. The script will be run in the context of the current island. The script will run in the calling process, and will finish before the calling #signal: method returns. Unlike #startScript:, #runScript: does not need a ScriptScheduler running in order to work correctly"

	^self runScript: aScriptDescriptor withArguments: #() when: aTrigger