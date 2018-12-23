*Scripting-Extensions
asAsyncScriptMessageIn: scriptPerformer arguments: args
	"Convert the receiver into an appropriate ScriptMessageSend"
	^self scriptEvaluationSelector
		ifNil: [super asAsyncScriptMessageIn: scriptPerformer arguments: args]
		ifNotNil:
			[:selector|
			Processor activeIsland asyncScriptMessageSend 
				receiver: scriptPerformer 
				selector: selector
				arguments: {self},args]