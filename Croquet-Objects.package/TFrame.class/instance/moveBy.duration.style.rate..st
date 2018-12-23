yellow-scripts
moveBy: aDirection duration: aDuration style: aStyle rate: aSamplingRate
	| direction duration style rate endState styleFunc lastState startState deltaTime msecsDuration proportion newState startT progressT script |
	direction := aDirection ifNil:[self defaultDirection asMoveDirection * self defaultDistance].
	duration := aDuration ifNil:[self defaultDuration].
	style := aStyle ifNil:[self defaultInterpolationStyle].
	rate := aSamplingRate ifNil:[self defaultSamplingRate].

	"Get the ultimate state we're interested in"
	endState := direction.
	duration <= 0 ifTrue:[^self transformBy: (Matrix4x4 withOffset: endState)].
	"Compute msecs since that's what we'll be working on here"
	msecsDuration := duration * 1000.
	"Get the interpolation function (evaluating from 0-1 and returning values from 0-1)"
	styleFunc := style asScriptStyle.
	"Reset the interpolation state"
	lastState := startState := 0@0@0.
	"And go moving until we're out of time"
	rate := msecsDuration * rate // 1000.
	deltaTime := msecsDuration // rate.
	startT := self now.
	script := Processor activeProcess.
	1 to: rate do:[:i|
		progressT := (i*deltaTime) asFloat.
		(startT + progressT) waitUntil. "<-- here is where tea scheduling kicks in"
		"Compute the proportion of time that's over"
		proportion := progressT / msecsDuration asFloat.
		"Map it through the interpolation style"
		proportion := styleFunc value: proportion.
		"Compute the state (e.g., offset) at our new proportion"
		newState := startState interpolateTo: endState at: proportion.
		"Transform incrementally - this is so that we can superimpose animations."
		self transformBy: (Matrix4x4 withOffset: newState - lastState).
		"Remember last state for the next round"
		lastState := newState.
		"see if a stop was requested"
		script isStopRequested ifTrue:[^self].
	].
	(startT + msecsDuration) waitUntil. "<-- here is where tea scheduling kicks in"
	"Apply the remaining part of the transform (if any)"
	self transformBy: (Matrix4x4 withOffset: endState - lastState).
