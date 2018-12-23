*Scripting-Extensions
startScript: aScriptDescriptor when: aTrigger
"Evaluate the given script whenever the trigger becomes active. The script will be run in the context of the current island. If it is triggered by #signal: (the normal case) it will be started in a new process under the controll of the current ScriptScheduler. If triggered by #synchronousSignal:, it will run in the calling process, like a script created by #runScript:.. If running in the absence of a ScriptScheduler, use #runScript: instead"

	^self startScript: aScriptDescriptor withArguments: #() when: aTrigger