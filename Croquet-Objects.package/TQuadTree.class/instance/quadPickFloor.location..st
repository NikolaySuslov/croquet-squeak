render
quadPickFloor: pointer location: location

	| d rval |
	
	(outBox pointOverBox: location) ifFalse:[^ false.].
	rval := false.
	spheres ifNotNil:[
		spheres do:[ : sp |
			sp frame isSolid ifTrue:[
				d := (sp globalPosition - pointer globalPosition) abs.
				( d x < sp radius and: [d z < sp radius]) ifTrue:[
					(pointer pickDownSphere: sp) ifTrue:[
						(pointer pointerPickFloor: sp frame) ifTrue:[rval := true].
						].
					].
				].
			].
		].
		
	qtTL ifNotNil:[(qtTL quadPickFloor: pointer location: location) ifTrue:[rval := true].].
	qtBL ifNotNil:[(qtBL quadPickFloor: pointer location: location) ifTrue:[rval := true].].
	qtTR ifNotNil:[(qtTR quadPickFloor: pointer location: location) ifTrue:[rval := true].].
	qtBR ifNotNil:[(qtBR quadPickFloor: pointer location: location) ifTrue:[rval := true].].
	^ rval.