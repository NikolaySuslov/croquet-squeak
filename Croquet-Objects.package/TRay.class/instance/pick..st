picking
pick: bnds

	| position |

	bnds ifNil:[^ false ].
	bnds frame ifNotNil:[
		bnds frame isSolid ifTrue:[
			self downRay ifFalse:[ self pointerPick: bnds.] 
			ifTrue:[
				position := (bnds globalPosition - self globalPosition).
				position *= position.
				(position x + position z < bnds radiusSquared) ifTrue:[
					(self pickDownSphere: bnds) ifTrue:[
						(self pointerPickFloor: bnds frame) ifTrue:[ ^ true. ].
					].
				].
			].
		].
	].
	^ false.