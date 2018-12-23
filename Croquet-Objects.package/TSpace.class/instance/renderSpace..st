render
renderSpace: ogl


"----- test if enter the portal here -----"
	ogl avatar ifNotNil:[
	ogl avatar prepareRayTest ifTrue:[
	portalFrames do: [ :pf | 
		 "------ is the portal visible? ------"
		pf visible ifTrue:[
		" ------ portal near avatar?-----"
			(pf testEnter:ogl avatar:ogl avatar) ifTrue:[ ogl noSwap. ^ 0.].
	].].].].
	^self renderSpace: ogl port: nil depth: 1 ghostFrame: nil.
