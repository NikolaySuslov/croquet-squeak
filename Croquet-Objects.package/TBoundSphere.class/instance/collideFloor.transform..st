collision
collideFloor: floor transform: trans

	| collideLoc rval vrt |
	
"	(trans localPointToGlobal: localPosition) y - floor > radius ifTrue:[ ^ nil. ]."

	collideLoc := Vector4 x: 0.0 y: Float infinity z: 0.0 w:0.0.

	vertices ifNil:[ 
		children do:[ :c | 
			(trans localPointToGlobal: c localPosition) y - floor > c radius ifFalse:[
				rval := c collideFloor: floor transform: trans. 
				rval ifNotNil:[ collideLoc y > rval y ifTrue:[collideLoc := rval.].].].].
			collideLoc y <= floor ifTrue:[^ collideLoc.].
			^ nil.
	] ifNotNil: [
		children ifNil:[
			vertices do:[:v | 
				vrt := trans localPointToGlobal: v. 
				vrt y < floor ifTrue:[ vrt y < collideLoc y ifTrue:[ 
					collideLoc := vrt asVector4. 
					collideLoc w: vrt y - floor].].].] 		
		ifNotNil:[
			children do:[:f | 
				vrt := trans localPointToGlobal: (vertices at: (f+1)).
				vrt y < floor ifTrue:[ vrt y < collideLoc y ifTrue:[ 
					collideLoc := vrt asVector4. 
					collideLoc w: vrt y - floor.].].].].].
	collideLoc y <= floor ifTrue:[ ^ collideLoc.].
	^ nil.
