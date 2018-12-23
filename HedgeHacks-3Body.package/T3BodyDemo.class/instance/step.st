stepping
step
	| trans rot delta secs msecs count |
	msecs := stepRemainder + (50.0 * speed).
	stepRemainder := msecs \\ 50.
	count := msecs // 50.
	count timesRepeat:[
		secs := 0.05.
		earthRot := earthRot+(25.0*secs).
		trans := earth translation.
		rot := Matrix4x4 identity rotationAroundY: earthRot.
		earth localTransform: (tilt composeWith: rot).
		earth localTransform: rot.
		earthFrame localTransform: rot.
		earth translation: trans.
		earthFrame translation: trans.
		delta := earth globalPosition - moon globalPosition.
	
		moonVelocity := moonVelocity + (delta normalized *  (secs * (earthGravity mass/1000) * (moonGravity mass/1000)/  (delta dot: delta))).
		moon translation: moon translation + (secs * moonVelocity).

		thirdBody step.
	].
	(self future: 50) step.