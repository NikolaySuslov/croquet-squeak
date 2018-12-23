convert
facesToFaceGroup: fcs materials: mi

	| groups count mIndex gIndex |
	
" This method creates an OrderedCollection of alternating material indices followed by the face group."

	groups := OrderedCollection new.

	count := 1.
	1 to: fcs size by: 3 do:[ :i |
		mIndex := 1+ (mi at: count).
		count := count+1.
		gIndex := 0.
		" Which material group do I belong to?"
		1 to: groups size by: 2 do:[ :j |
			(mIndex = (groups at: j)) ifTrue:[gIndex :=j].].
		"No such material group, we need to add a new one."
		gIndex = 0 ifTrue:[ 
			groups add: mIndex. 
			groups add: OrderedCollection new. 
			gIndex := groups size -1.].
		gIndex := gIndex+1.
		(groups at: gIndex) add: (fcs at:i).
		(groups at: gIndex) add: (fcs at: i+1).
		(groups at: gIndex) add: (fcs at: i+2).].
			
	1 to: groups size by: 2 do:[ :i |
		groups at: i+1 put:(groups at: i+1) asIntegerArray.].
	^ groups.