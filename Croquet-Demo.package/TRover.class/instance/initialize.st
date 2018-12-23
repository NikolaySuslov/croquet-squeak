initialize
initialize

	| ray mesh |
	super initialize.
	mesh := (TLoad3DSMax new initializeWithFileName: (FileDirectory pathFromURI: 'Content/Mars/rover.ASE') scale: 0.05) frame.
	mesh translationX: 0 y:0 z:0.
	mesh collapse.
	mesh boundsDepth: 2.
	mesh initBounds.
	self addChild: mesh.
	body := (mesh find:[:frm | frm objectName = 'RoverBody']) at: 1.
	wheels := OrderedCollection new.
	wheels add: ((mesh find:[:frm | frm objectName = 'LFWheel']) at: 1).
	wheels add: ((mesh find:[:frm | frm objectName = 'LMWheel']) at: 1).
	wheels add: ((mesh find:[:frm | frm objectName = 'LRWheel']) at: 1).
	wheels add: ((mesh find:[:frm | frm objectName = 'RFWheel']) at: 1).
	wheels add: ((mesh find:[:frm | frm objectName = 'RMWheel']) at: 1).
	wheels add: ((mesh find:[:frm | frm objectName = 'RRWheel']) at: 1).
	wheelRays := OrderedCollection new.
	wheels do:[ :w | 
		w solid: false.
		ray := TRay new.
		ray downRay: true.
		ray setAutomatic: false.
		wheelRays add: ray.
		w parent addChild: ray.
	]. 
	frontTurn := OrderedCollection new.
	frontTurn add:((mesh find:[:frm | frm objectName = 'LFrtWhlAssembly']) at: 1).
	frontTurn add:((mesh find:[:frm | frm objectName = 'RFrtWhlAssembly']) at: 1).
	rearTurn := OrderedCollection new.
	rearTurn add:((mesh find:[:frm | frm objectName = 'LRearWhlAssembly']) at: 1).
	rearTurn add:((mesh find:[:frm | frm objectName = 'RRearWhlAssembly']) at: 1).
	leftFrontPair := ((mesh find:[:frm | frm objectName = 'LFrtWheelPair']) at: 1).
	rightFrontPair  := ((mesh find:[:frm | frm objectName = 'RFrtWheelPair']) at: 1).
	leftSide := OrderedCollection new.
	leftSide add:((mesh find:[:frm | frm objectName = 'LFrontWheelGroup']) at: 1).
	leftSide add:((mesh find:[:frm | frm objectName = 'LRearWheelGroup']) at: 1).
	rightSide := OrderedCollection new.
	rightSide add:((mesh find:[:frm | frm objectName = 'RFrontWheelGroup']) at: 1).
	rightSide add:((mesh find:[:frm | frm objectName = 'RRearWheelGroup']) at: 1).

	wheelRadius := (wheels at: 1)frameBox extent x/2.0.
	wheelBase := ((wheels at: 1) globalPosition - (wheels at: 3) globalPosition) length.
	axleLength :=((wheels at: 1) globalPosition - (wheels at: 4) globalPosition) length.
	speed := 0.0.
	wheelRotSpeed := 0.0.
	wheelAngle := 0.0.
	deltaSpeed := 0.1.
	turn := 0.0.
	turnAngle := 0.
	turnSpeed := 0.0.
	v1 := (wheels at: 1) globalPosition - (wheels at: 2) globalPosition.
	v2 := leftFrontPair globalPosition - (wheels at:2) globalPosition.
	v3 := leftFrontPair globalPosition - (wheels at:3) globalPosition.
	vlr := (leftSide at: 1) globalPosition - (rightSide at: 1) globalPosition.
	trans := 50.
	doStep := false.