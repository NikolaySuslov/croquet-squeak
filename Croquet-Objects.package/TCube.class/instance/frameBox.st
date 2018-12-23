accessing
frameBox
	"Answer the local bounding box of this frame"
	self flag: #jcg.  "Shouldn't this take 'location' into account?"

	^TBox origin: extent/-2.0 corner: extent/2.0.