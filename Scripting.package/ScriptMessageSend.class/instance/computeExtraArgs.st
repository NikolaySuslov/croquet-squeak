evaluating
computeExtraArgs
	^extraArgs ifNil:[
		extraArgs := selector numArgs "how many do we need?"
					- self arguments size "how many do we have?".
		"resize arguments to fit"
		extraArgs < 0 ifTrue:[
			arguments := arguments copyFrom: 1 to: arguments size + extraArgs.
			extraArgs := 0].
		extraArgs > 0 ifTrue:[arguments := arguments, (Array new: extraArgs)].
		extraArgs].