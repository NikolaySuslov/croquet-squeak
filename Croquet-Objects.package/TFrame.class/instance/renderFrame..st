render
renderFrame: ogl

" #renderFrame: must return the number of objects that were rendered - failure to do so will just crash."

	| count childCount ac distanceSquared hilite |

	count := 0.
	(visible or:[frameChildren notNil])ifFalse:[^ 0 ].
	
	ac := ogl camera.

	" apply the local transform to this matrix "
	frameChanged ifTrue:[
self islandViolation:'this code must be moved somewhere else'.
		self globalTransform: (frameParent globalTransform * localTransform).
	].
	ogl pushMatrix. 
	ogl glMultTransposeMatrixf: localTransform. 

	hilite := false.
	self currentHiliteColor ifNotNil: [
		hilite := ogl forceHilite: self currentHiliteColor.
		hilite ifTrue: [ ogl pushFog ].
	].

"------ is this inside the viewing pyramid?"
	(visible and:[ac testBounds: self boundSphere]) ifTrue:[
		ogl eventPointer ifNotNil:[
		(ogl forcePick or:[self objectOwner eventMask~=EventNone]) ifTrue:[
			self isPortal ifFalse:[
				(ogl eventPointer pointerPick: self boundSphere) ifTrue:[
					ogl eventPointer selectedCameraTransform: ac globalTransform copy.
					ac currentPortal ifNil:[ ogl eventPointer selectedPortal:nil point:nil].
				].
			].
		].
		].
		count := 1.
		distanceSquared :=((ac globalPosition-self globalPosition)squaredLength*ac frameScaleSquared).
		ogl distance: distanceSquared.

		(self hasOpaque:ogl)ifTrue:[
			self render: ogl.
		].

		(self hasAlpha:ogl) ifTrue: [ 
			self root addAlphaObject: self 
				transform: ogl peekMatrix
				distance: distanceSquared
				parent: frameParent
				transparency: ogl transparency.
		].
	].

	frameChildren ifNotNil:[
		" render all of the child frames "
		childCount := 0.
		frameChildren do:[:rFrame | childCount := childCount+(rFrame renderFrame: ogl).].
		childCount > 0 ifTrue:[count := count+childCount. ]
		].

	hilite ifTrue: [
		ogl forceHilite: nil.
		ogl popFog.
	].
	ogl popMatrix.
	^ count.


