*Scripting-Extensions
asScriptMessageIn: scriptPerformer arguments: args
	"Convert the receiver into an appropriate ScriptMessageSend"
	^self scriptEvaluationSelector
		ifNil: [super asAsyncScriptMessageIn: scriptPerformer arguments: args]
		ifNotNil:
			[:selector|
			ScriptMessageSend 
				receiver: scriptPerformer 
				selector: selector
				arguments: {self},args]