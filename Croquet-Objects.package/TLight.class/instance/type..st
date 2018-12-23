accessing
type: tp

	| |
	
	tp = type ifTrue:[ ^ self ].
	type := tp.
"	pos := self positionV."

	tp = #directional ifTrue:[
		position := #(0 -1.0 0 0) asFloatArray.
		] 
		ifFalse:[
	tp = #point ifTrue:[
		position := #(0 0 0 1) asFloatArray.
		] ifFalse:[
	tp = #spot ifTrue:[
		position := #(0 -1.0 0 1) asFloatArray.
	]]].

"	self positionV: pos."
	self removeAll.
	renderObject := nil.
	self initializeRenderObjectIfNeeded.
	