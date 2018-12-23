access
scale: scale 
	self radius: radius * scale.
	self localPosition: self localPosition * scale.
	box ifNotNil: [ box scale: scale ].
	children
		ifNotNil: [children
				do: [:each | (each isMemberOf: TBoundSphere)
						ifTrue: [each scale: scale]]]