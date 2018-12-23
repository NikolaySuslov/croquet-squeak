accessing
frameBox
	"Answer the local bounding box of this frame"
	self boundSphere ifNotNil:[
		^ self boundSphere box.].
	^TBox origin: 0@0@0 corner: 0@0@0