*Scripting-Extensions
asScriptMessageIn: scriptPerformer arguments: args
	"Convert the receiver into an appropriate ScriptMessageSend"
	^ScriptMessageSend receiver: scriptPerformer selector: self arguments: args