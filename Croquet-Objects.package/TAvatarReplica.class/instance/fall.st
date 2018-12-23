driving
fall

	| trans ht transFloor downPosition floor dist pos |
	floor := downPointer selectedFrame.
	dist :=  downPointer selectedDistance.
	pos := downPointer selectedFramePosition.
	downPointer resetTotal.
	floor ifNotNil:[
	floor isSolid ifTrue:[
		trans := self translation.
" ---- Calculate distance to the current floor."
		dist = height ifFalse:[
			ht := trans y + height - dist.
			trans y > ht ifTrue:[ trans y - ht > 0.5 ifTrue:[ ht := trans y - 0.5.].].
			trans y: ht].
" ---- Calculate the floor frame position in the floor's local frame. "
		transFloor := footFrame globalPosition-lastDownPosition.
		lastDownFrame ~= floor ifTrue:[
			floor addChild: footFrame.
			].
		downPosition := pos.
		downPosition y: (downPosition y-height).
		footFrame translation: downPosition.
		lastDownPosition := footFrame globalPosition.
		lastDownFrame := floor.
		trans x: trans x+transFloor x y: trans y z: trans z+ transFloor z.
		self translation = trans ifFalse: [
		"	lastPosition := trans."
			self translation: trans.
			self localTransform:  self localTransform shallowCopy. ]	"why clone?"	
		].
	].
