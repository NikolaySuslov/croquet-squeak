*Scripting-Extensions
asAsyncScriptMessageIn: scriptPerformer arguments: args
	"Convert the receiver into an appropriate ScriptMessageSend"
	^Processor activeIsland asyncScriptMessageSend 
		receiver: scriptPerformer selector: self arguments: args