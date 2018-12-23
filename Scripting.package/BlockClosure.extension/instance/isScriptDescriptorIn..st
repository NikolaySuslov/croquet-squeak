*Scripting-Extensions
isScriptDescriptorIn: aScript
	"Answer if the receiver is equivalent to the argument script, a ScriptMessageSend"
	^aScript selector == self scriptEvaluationSelector
	  and: [(aScript arguments at: 1) == self]