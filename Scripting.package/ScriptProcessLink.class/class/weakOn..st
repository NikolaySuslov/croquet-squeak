instance creation
weakOn: aProcess
	^(ScriptProcessLinkWeak new: 1) process: aProcess