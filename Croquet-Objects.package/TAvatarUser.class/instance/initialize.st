initialize
initialize

	super initialize.
	controlPitch := false.
	cameraBehind := false.
	head := nil.
	thirdPerson := 1.0.	"Slightly above and behind the avatar origin."
	thirdPersonLag := 3.0.	"Moderately high lag, feels like driving."
	speedControl := 0@0.
	currentSpace := nil.
	portalRay := TRay new.
	driving := false.
	lastLength := 0.5.
	self runScript: #onSnapshot: when:{self. #snapshot}.
