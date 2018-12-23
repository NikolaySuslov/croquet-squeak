messaging
send: selector withArguments: args
	"Send the selector, aSymbol, to the receiver with arguments in argArray."
	^self syncSend: selector withArguments: args