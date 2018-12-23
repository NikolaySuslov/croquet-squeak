*Scripting-Extensions
evaluate: aBlock with: arg1 with: arg2 with: arg3 with: arg4
	^aBlock valueWithArguments: {arg1. arg2. arg3. arg4}