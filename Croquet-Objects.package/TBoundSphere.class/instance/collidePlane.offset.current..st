collision
collidePlane: norm offset: offst current: current

	| distance rval vrt |
	
" Presumably, we already know that the current sphere intersects this plane - we just want to test its contents."

	rval := current.
	vertices ifNil:[ 
		children do:[ :c | 
			(c localPosition dot: norm)-offst < c radius ifTrue:[
				rval := c collidePlane: norm offset: offst current: rval.].].
			^ rval.
	] ifNotNil: [
		children ifNil:[
			vertices do:[:v | 
				distance := (v dot: norm) - offst. 
				distance < 0.0 ifTrue:[
					distance < rval w ifTrue:[ rval := v asVector4. rval w: distance.].].
				].] 		ifNotNil:[
			children do:[:f | 
				vrt := vertices at: (f+1).
				distance := (vrt dot: norm) - offst.
				distance < 0.0 ifTrue:[
					distance < rval w ifTrue:[ rval :=  vrt asVector4. rval w: distance.].].
				].].].
	^ rval.
