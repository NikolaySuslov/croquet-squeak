initialize
makeMorph: morphClass
	| morph |
	morphClass ifNotNil:[
		morph := morphClass new.
		(morph respondsTo: #embeddedApp:) ifTrue:[morph embeddedApp: app].
	].
	^self makeWorld: morph