*Scripting-Extensions
asTickMessageIn: scriptPerformer arguments: args
	"Convert the receiver into an appropriate ScriptMessageSend"
	^TickMessageSend receiver: scriptPerformer selector: self arguments: args