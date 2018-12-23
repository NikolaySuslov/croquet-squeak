actions
resizeBox: pointer
"This needs to be fixed - since the plane does not go through the center of the cube, there is a limit to how small this can get in any one motion. The advantage is this keeps us from getting too small."
	| len1 len2  norm sp sc|

	norm := (pointer camera frameLookAt: self) negated.
	sp := selectedFrame localTransform localPointToGlobal: selectedPoint.
	(pointer frame: self pickPlane: sp normal: norm) ifTrue:[
		len1 := sp length.
		len2 := pointer selectedPoint length.
		len1 = 0.0 ifTrue:[^ false.].
		sc := len2/len1.
		self scale: sc.
		scaleContents := scaleContents * sc.
		selectedPoint := (selectedFrame localTransform orthoNormInverse localPointToGlobal: pointer selectedPoint).
		^ true.].
	^ false.