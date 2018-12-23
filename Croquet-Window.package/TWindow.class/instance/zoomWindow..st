actions
zoomWindow: event

	| delta  cNorm pointer |

" This should limit the distance away from the user you can drag an object. When I have more time..."
	pointer := event makePointer.
	(pointer frame: self pickFrontPlane: selectedPoint normal: 
		(self inverseGlobalOrientation localPointToGlobal: cameraLookUp)) ifTrue:[
			delta := selectedPoint - pointer selectedPoint.
			self translation: (self translation - (self orientation localPointToGlobal: delta)).
			^ true.
		] ifFalse:[
			cameraLookUp := cameraLookUp negated.
			cNorm := (self inverseGlobalOrientation localPointToGlobal: cameraLookUp).
			self translation: (self translation - (selectedPoint * cNorm * -2.0)).
			^ true.
		].
	^ false.