picking
pointerPick: bnds
	| position frame gpAt dp d |

	bnds ifNil:[^ false.].

	focusSelected ifNil:[^ super pointerPick: bnds].

	focusSelected = bnds frame objectOwner asFarRef ifTrue:[
		position := bnds globalPosition - self globalPosition.
		self selectedRayTransform: self localTransform.
		self selectedDistance > ((position length - bnds radius) * frameScale) 		ifTrue:[
				gpAt := self globalTransform column3.
				dp := position - ((gpAt dot: position)*gpAt).
				d := dp dot: dp.
				d < bnds radiusSquared ifFalse:[ ^ false ].
				self sphereDistSquared: d.
				frame := bnds frame.
				self currentFrame: frame.
				(frame pick: self) ifTrue:[
					self selectedPoint ifNil:[self selectedPoint: Vector3 new.].
					self selectedGlobalPoint: 
						(frame globalTransform localPointToGlobal:self selectedPoint).
					self selectedFrame: frame.
					self selectedParent: frame parent.
					self selectedFramePosition:  self framePosition.
					self selectedTarget: frame objectOwner.
					self selectedEventMask: frame objectOwner getAllEventsHandled.
					self selectedScale: frameScale.
	"				self selectedCameraTransform: self parent globalTransform."
					^ true.
				].
			].
		].
	^ false.