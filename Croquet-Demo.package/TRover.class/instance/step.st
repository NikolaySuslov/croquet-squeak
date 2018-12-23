stepping
step
	| yloc a1 a2 dv py secs |
	doStep ifFalse:[ ^ self ].
	secs := 0.05.
	speed ~= 0.0 ifTrue:[
		wheelAngle := wheelAngle + (wheelRotSpeed * secs).
		turnAngle := turnAngle + (turnSpeed * secs).
		turnAngle > 360 ifTrue:[ turnAngle := turnAngle - 360.].
		turnAngle < 0 ifTrue:[ turnAngle := turnAngle + 360].
		wheels do:[ :w | w rotationAroundZ: wheelAngle.].
		self translation: self translation+(self globalTransform column1*speed*secs).
		self rotationAroundY: turnAngle.
		(wheelRays at:1) selectedDistance ~= Float infinity ifTrue:[
			yloc := Array ofSize: 6.
			1 to: 6 do:[:index |
				yloc at: index put: ((wheels at: index) globalPosition y) - 
					((wheelRays at: index) selectedDistance - wheelRadius).].		
			dv := v1 copy.
			dv y: (yloc at:2) -(yloc at:1).
			a1 := v1 angleTo: dv.
			dv y > v1 y ifTrue:[a1 := a1 negated].
			py := (yloc at: 2) + (v2 x * (a1 sin)) + (v2 y * (a1 cos)).
			dv := v3 copy.
			dv y: py - (yloc at: 3).
			a2 := v3 angleTo: dv.
			dv y < v3 y ifTrue:[ a2 := a2 negated].
			a1 := (a1 - a2) radiansToDegrees.
			a2 := a2 radiansToDegrees.
			leftFrontPair rotationAroundZ:  a1.
			(leftSide at: 1) rotationAroundZ: a2.
			(leftSide at: 2) rotationAroundZ: a2.

			dv := v1 copy.
			dv y: (yloc at:5) -(yloc at:4).
			a1 := v1 angleTo: dv.
			dv y > v1 y ifTrue:[a1 := a1 negated].
			py := (yloc at: 5) + (v2 x * (a1 sin)) + (v2 y * (a1 cos)).
			dv := v3 copy.
			dv y: py - (yloc at: 6).
			a2 := v3 angleTo: dv.
			dv y < v3 y ifTrue:[ a2 := a2 negated].
			a1 := (a1 - a2) radiansToDegrees.
			a2 := a2 radiansToDegrees.
			rightFrontPair rotationAroundZ:  a1.
			(rightSide at: 1) rotationAroundZ: a2.
			(rightSide at: 2) rotationAroundZ: a2.
			py := (wheelRays at: 3) selectedDistance + ((wheelRays at:6) selectedDistance)/2.0.
			self translation: (self translation - (0@(py - wheelRadius)@0)).
		].
	].
	(self future: 100) step.