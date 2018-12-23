accessing
deleteTexturesOlderThan: aTimeStamp 
	| old |
	old := OrderedCollection new.
	textures keysAndValuesDo: [:tex :handle |
		handle timeStamp < aTimeStamp
			ifTrue: [old add: tex]].
	old do: [:each | self deleteTexture: each].
	^ old size