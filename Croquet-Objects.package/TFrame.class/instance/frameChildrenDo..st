accessing
frameChildrenDo: aBlock
	frameChildren ifNil:[^self].
	^frameChildren do: aBlock