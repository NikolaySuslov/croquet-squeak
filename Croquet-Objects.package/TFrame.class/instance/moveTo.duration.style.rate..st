yellow-scripts
moveTo: aTarget duration: aDuration style: aStyle rate: aSamplingRate
	| target targetDir length |
	target := aTarget ifNil:[^self].
	targetDir := self globalToLocal: target globalPosition.
	targetDir y: 0.0.
	length := targetDir length.
	targetDir := targetDir / length.
	^self move: targetDir distance: length duration: aDuration style: aStyle rate: aSamplingRate