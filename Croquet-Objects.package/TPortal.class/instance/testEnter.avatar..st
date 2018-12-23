enterExit
testEnter: ogl avatar: avatar

	| pc vwPnt m1 m2 trans newSpace |
"this can only determine if a portal transition needs to occur. You can't actually do the portal transition here, because we are actually inside of the portal's Island. The actual transition is handled by the CroquetHarness if the newPostcard field of this object is not nil."

	blocked ifTrue:[^ false ].  "You can only look, not pass through."

 	pc := postcard.
	self = pc ifTrue:[ ^false].
	vwPnt := pc resolveViewpoint: ogl.	
	vwPnt ifNil:[ ^ false. ].
	avatar portalRay doSelect ifFalse:[ ^ false. ].
	vwPnt send:[ :toPortal |
		toPortal root ifNil:[^ false]. "portal is closed"

		(avatar portalRay pointerPick: self boundSphere) ifTrue:[
			m1 := self globalTransform.
			toPortal isPortal ifTrue:[ m2 := toPortal globalMatrixOut.]
			ifFalse:[ m2 := toPortal globalTransform.].
			trans := m2 * m1 orthoNormInverse.
			avatar newTransform: (trans * ogl avatar globalTransform).
			avatar jumpCameraTrans: (trans * ogl camera globalTransform).
			newSpace := toPortal root.
			newSpace send:[:ns |  avatar newPostcard: ns postcard.].
			^ true.
		].
	].
	^ false.