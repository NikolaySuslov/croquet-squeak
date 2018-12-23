accessing
renderObject
	^renderObject ifNil:[
		type = #point ifTrue:[ self renderPoint].	
		type = #directional ifTrue:[ self renderDirectional].
		type = #spot ifTrue:[ self renderSpot].
		renderObject.
		]. 