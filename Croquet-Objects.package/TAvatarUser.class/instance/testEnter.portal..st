portals
testEnter: ogl portal: portal

	| pc vwPnt m1 m2 trans newSpace |
"this can only determine if a portal transition needs to occur. You can't actually do the portal transition here, because we are actually inside of the portal's Island. The actual transition is handled by the CroquetHarness if the newPostcard field of this object is not nil."
 	pc := portal postcardLink.
	portal = pc ifTrue:[ ^false].
	vwPnt := pc resolveViewpoint: ogl.	
	vwPnt ifNil:[ ^ false. ].
	portalRay doSelect ifFalse:[ ^ false. ].
	vwPnt send:[ :toPortal |
		toPortal root ifNil:[^ false]. "portal is closed"

		(portalRay pointerPick: portal boundSphere) ifTrue:[
			m1 := portal globalTransform.
			toPortal isPortal ifTrue:[ m2 := toPortal globalMatrixOut.]
			ifFalse:[ m2 := toPortal globalTransform.].
			trans := m2 composeWith: m1 orthoNormInverse.
			newTransform := trans composeWith: ogl avatar globalTransform.
			newSpace := toPortal root.
			newSpace send:[:ns |  newPostcard := ns postcard.].
			^ true.
		].
	].
	^ false.