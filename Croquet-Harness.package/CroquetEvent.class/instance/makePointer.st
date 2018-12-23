accessing
makePointer

	| pointer |
	pointer := TRay new.
	pointer globalTransform: (selection cameraTransform composeWith: selection rayTransform ).
	pointer frameScale: selection scale.
	^ pointer.