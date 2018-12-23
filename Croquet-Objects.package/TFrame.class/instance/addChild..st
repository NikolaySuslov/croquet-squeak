hierarchy
addChild: child

	frameChildren ifNil:[frameChildren := OrderedCollection new.].

"We can not add this frame until we have removed it from a previous parent."

	child isFrame ifTrue:[
		child parent ifNotNil:[child parent removeChild: child].
"Register the child if it can handle events. It remains its own object owner."
		child eventMask~=EventNone ifTrue:[child register.] 
		ifFalse:[ objectOwner eventMask ~= EventNone ifTrue:[
			objectOwner addOwnership: child.].
		].
"make sure child and all its subframes are informed of all viewers so they can be added to their tea parties"
		frameChildren add: child.
		child root: self root.
		child parent: self.
		child addLightFrames.
		child addPortalFrames.
		child addRayFrames.
		self signal: #structureChanged.
		child frameChanged.
		self root ifNotNil:[self root doStart:child. ].
	] ifFalse:[ child isPostcard ifTrue:[ frameChildren add: child. ].].