driving
updateCamera: aCamera
	"Update camera to follow avatar"
	| at ct trans bt weight tp2 sticky lockStep |

	replica ifNil:[^false].
	jumpCameraTrans ifNotNil:[
		aCamera localTransform: jumpCameraTrans.
		jumpCameraTrans := nil.
	].
	(viewAngle = aCamera viewAngle and:[viewAspect = aCamera aspect]) ifFalse:[
		viewAngle := aCamera viewAngle.
		viewAspect := aCamera aspect.
		replica ifNotNil:[replica future viewAngle: viewAngle aspect: viewAspect].
	].
	sticky := replica get: #sticky.
	(sticky or:[cameraBehind]) ifTrue:[
		"Put camera directly into the spot"
		^aCamera localTransform: (replica get: #globalTransform).
	].

	lockStep := (replica get:#lockStep).
	tp2 := thirdPerson squared.
	at := (replica get: #globalTransform).
	self signal:#pitchYawRoll with: at pitchYawRoll.
	ct := aCamera localTransform.
	weight := 1.0 / (thirdPersonLag max: 1).
	trans := Matrix4x4 identity. 
	trans translation: (Vector3 x:0.0 y:0.7 z: 4)*tp2.
	bt := at composeWith: trans. "This is the target position of the camera"
	lockStep ifTrue:[aCamera localTransform: bt. ] ifFalse:[
		trans := ct translation + ((bt translation - ct translation) * weight).
		at := at asQuaternion.
		ct := ct asQuaternion.
		ct := ct slerpTo: at at: weight.
		aCamera localTransform: (ct asMatrix4x4 translation:trans).
	].