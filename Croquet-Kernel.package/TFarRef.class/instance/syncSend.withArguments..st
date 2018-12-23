private
syncSend: selector withArguments: arguments 
	"Send the selector, aSymbol, to the receiver with arguments in arguments."
	| copier args dstIsland srcIsland result pp arg |
	myValue == self ifTrue:[^self error:'Cannot send sync messages to unresolved far refs'].
	srcIsland := Processor activeIsland.
	dstIsland := myIsland.
	srcIsland == dstIsland 
		ifTrue:[^myValue perform: selector withArguments: arguments].

	copier := nil.
	args := arguments shallowCopy.
	1 to: arguments size do:[:i|
		arg := arguments at: i.
		(IslandArgumentCopier isPassByIdentity: arg) ifFalse:[
			copier ifNil:[copier := IslandArgumentCopier new from:  srcIsland to: dstIsland].
			arg := copier pass: arg.
		].
		args at: i put: arg.
	].
	
	result := Processor activeProcess activateIslandWithEscape: myIsland
		during: [myValue perform: selector withArguments: args].
	^self syncReturn: result from: dstIsland to: srcIsland
	
	"pp := Processor activeProcess.

	pp island: myIsland.
	[[
		result := myValue perform: selector withArguments: args]
		ensure:[pp island: srcIsland]]
		on: Exception do: [:ex |
			pp island: srcIsland. ex outer.
			pp island: dstIsland. ex resume].
	^self syncReturn: result from: dstIsland to: srcIsland"