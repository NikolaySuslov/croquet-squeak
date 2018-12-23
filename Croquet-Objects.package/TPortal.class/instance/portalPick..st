render
portalPick: eventPointer

		| saveSelected portalDistance portalPoint |
		saveSelected := eventPointer copiedSelection.
		
		(eventPointer pointerPick: self boundSphere) ifTrue:[
				portalDistance := eventPointer selectedDistance.
				eventPointer minDistance: portalDistance.
				portalPoint := eventPointer selectedPoint.
				eventPointer selected: saveSelected. "restore the current selections"
				eventPointer selectedPortal: self point: portalPoint. "if we picked a portal"
			] ifFalse:[ 
				eventPointer pointerDown ifTrue:[
					eventPointer selectedPortal = self ifTrue:[
						(eventPointer frame: self pickPlane: (Vector3 new) normal: outVector)
						 ifTrue:[ 
							portalPoint := eventPointer selectedPoint.
							eventPointer selected: saveSelected.
							eventPointer selectedPortalPoint: portalPoint.
						].
					].
				]. 
				portalDistance := Float infinity.
				eventPointer doSelect: false. "don't select since pointer is outside portal"
				eventPointer selected: saveSelected.
			].
	^ portalDistance.