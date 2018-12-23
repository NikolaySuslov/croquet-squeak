enterExit
testEnter: ogl avatar: avatar

	| pc vwPnt trans otrans ctrans ttrans relativeTrans |
"this can only determine if a portal transition needs to occur. You can't actually do the portal transition here, because we are actually inside of the portal's Island. The actual transition is handled by the CroquetHarness if the newPostcard field of this object is not nil."
	blocked ifTrue:[ ^false ].
	pc := postcard.
	pc ifNil:[ ^false ].
	self = pc ifTrue:[ ^false ].
	vwPnt := pc resolveViewpoint: ogl.	
	vwPnt ifNil:[ ^ false. ].
	avatar portalRay doSelect ifFalse:[ ^ false. ].
	cube test: #cubeTest.
	vwPnt send:[ :toPortal |
		toPortal root ifNil:[^ false]. 
		(avatar portalRay pointerPick: cube boundSphere) ifTrue:[
			ttrans := transform copy.
			ttrans translation: ttrans translation * scale.
			otrans:=(self globalTransform * ttrans orientation * ttrans translationMatrix)orthoNormInverse.
			trans := otrans * avatar globalTransform.
			trans translation: trans translation/scale.
			avatar newTransform: trans.
relativeTrans := ogl camera relativeTransform: avatar.
			ctrans := otrans * ogl camera globalTransform.
			ctrans translation: ctrans translation/scale.
			avatar jumpCameraTrans: ctrans.
			ogl camera globalTransform: ctrans.
			ogl camera  globalPositionForce: ogl camera globalPosition.
avatar newTransform: ogl camera globalTransform * relativeTrans.
			toPortal root send:[:sp| avatar newPostcard: sp postcard.].
			^ true.
		].
	].
	^ false.