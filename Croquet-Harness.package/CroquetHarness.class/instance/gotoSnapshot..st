accessing
gotoSnapshot: snap
	| pc sp tfm vp |
	pc := snap postcard.
	pc ifNil:[
		sp := snap space.
		tfm := snap globalTransform.
	] ifNotNil:[
		vp := self findViewpointByPostcard: pc.
		sp := (vp get: #root) ifNil:[^nil].
		tfm := vp get: #globalMatrixOut.
	].
	avatar newTransform: tfm.
	avatar newPostcard: (sp get: #postcard).