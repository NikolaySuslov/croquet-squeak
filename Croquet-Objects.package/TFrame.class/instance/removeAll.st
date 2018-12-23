hierarchy
removeAll
	| child |
	
	frameChildren ifNil:[^nil.].

	[frameChildren size = 0] whileFalse:[
		child := frameChildren at: 1.
		frameChildren removeAt: 1.
		child removeLightFrames.
		child removePortalFrames.
		].
	frameChildren := nil.
