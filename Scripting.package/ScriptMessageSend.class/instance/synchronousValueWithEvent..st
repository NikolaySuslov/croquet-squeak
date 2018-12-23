evaluating
synchronousValueWithEvent: anEvent
	| args count index |
	extraArgs ifNil:[self computeExtraArgs]. "resize"
	(extraArgs = 0 "no extra args needed"
		or:[anEvent == nil]) "or no extra args available"
			ifTrue:[^self synchronousValueWithArguments: arguments event: anEvent].
	"Need some arguments from args"
	args := arguments shallowCopy.
	index := arguments size - extraArgs.
	count := extraArgs min: anEvent arguments size.
	args replaceFrom: index+1 to: index+count with: anEvent messageArguments startingAt: 1.
	index := index + count.
	index < args size ifTrue:[args at: index+1 put: anEvent].
	^self synchronousValueWithArguments: args event: anEvent