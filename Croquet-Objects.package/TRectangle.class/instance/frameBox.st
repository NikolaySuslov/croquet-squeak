accessing
frameBox
	"Answer the local bounding box of this frame"
	^TBox origin: (Vector3 x: extent x/-2.0 y: extent y/-2.0 z:0.0) 
		corner: (Vector3 x: extent x/2.0 y: extent y/2.0 z:0.0) .