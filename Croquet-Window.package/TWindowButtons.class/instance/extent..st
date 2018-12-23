initialize
extent: ext

	| height |
	height := 0.55.

	gotoButton translation:(Vector3 x: 0 y: ext y/2.0+height+0.25 z:0.0).
	grabButton translation:(Vector3 x: ext x/4.0 y: ext y/2.0+height z:0.0).
	cameraButton translation:(Vector3 x: ext x/-4.0 y: ext y/2.0+height z:0.0).
	killButton translation:(Vector3 x: ext x/-2.0 y: ext y/2.0+height z:0.0).
	openButton translation:(Vector3 x: ext x/2.0 y: ext y/2.0+height z:0.0).

