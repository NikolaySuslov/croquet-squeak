render
renderSnapshot: snapshot
	"Update the snapshot"
	| delta sp pc tfm vp |
	pc := snapshot postcard.
	pc ifNil:[
		sp := snapshot space.
		sp isResolved ifFalse:[^nil]. "don't even try"
		tfm := snapshot globalTransform.
	] ifNotNil:[
		vp := self findViewpointByPostcard: pc.
		vp isResolved ifFalse:[^nil].
		sp := (vp get: #root) ifNil:[^nil].
		tfm := vp get: #globalMatrixOut.
	].
	ogl camera: TCamera new.
	ogl camera bounds: snapshot bounds.
	ogl camera initFrustum: ogl.
	ogl camera localTransform: tfm.
	sp renderView: ogl overlay: #().
	ogl camera killFrame: true.
	delta := bounds height - snapshot bounds height.
	snapshot form: (ogl screenShot: (ogl camera bounds translateBy: 0 @ delta)).