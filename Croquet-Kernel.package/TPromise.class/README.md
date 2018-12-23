I represent a promise being used when a client needs the result of a future message. In that situation the client can use the promise to execute code when the message is actually executed.
Note that this implementation assumes one consumer of the promise.  If you wait twice on the promise one of the consumers will wait forever. Similarly for whenComplete: - i you try to add 2 when complete blocks, only the last one added will work.

Instance variables:
	myIsland	<>	
	myName	<>
	myScripts	<Array>		Cached script registry for delayed execution
	resolved	<Boolean>	True if the message has been resolved.
	broken		<Boolean>	True if the message has been broken.
	result		<Object>		The result of the promise (often a FarRef), or the exception, if broken
	resolver	<Block>		The code to be executed when the promise completes.
	resolvers	<Array of Block>		The code to be executed when the promise completes.
	handlers	<Array of Block>		The code to be executed when the promise completes.

Example:
	island := TIsland new.					"creates a new island"
	promise := island future new: Point.		"creates a promise representing the #new: message"
	promise whenComplete:[:result|			"code being executed when promise completed"
		result future x: 1.
		result future y: 2.
	].

