stepping
step
	| secs go transfer |

	doStep ifTrue:[
		self determinePosition.
		deltaTime := 60.0.
		lastGlobalPosition ifNotNil:[
			globalVelocity := (self globalPosition - lastGlobalPosition)/deltaTime*1000.0.
			].
		lastGlobalPosition := self globalPosition.

		pLifetime -= deltaTime.
		secs := deltaTime/1000.0.
		secs := secs min: 0.1.
		attractors size > 0 ifTrue:[self doAttractors: secs].
		pPosition replaceFrom: 1 to: pPosition size with: pLastPosition startingAt: 1.
		pPosition += (pVelocity * secs).
		pVelocity += (pAcceleration * secs).
		pColor ifNotNil:[	pColor -= (pDeltaColor*deltaTime).].
		go := self globalOrientation.
		tpr := go localBoxToGlobal: positionRange.
		tvr := go localBoxToGlobal: velocityRange.
		tar := go localBoxToGlobal: accelerationRange.

		1 to: size do:[:index |
			(pLifetime at: index) < 0.0 ifTrue:[self regenerate: index.].
			].
		transfer := pPosition.
		pPosition := pLastPosition.
		pLastPosition := transfer.
		(self future: self stepTime) step.
	].
	
