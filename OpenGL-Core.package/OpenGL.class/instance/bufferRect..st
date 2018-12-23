initialize
bufferRect: box
	"Set and validate the receiver's buffer rectangle"
	bufRect = box ifTrue:[^self].
	(self primRender: handle setBufferRectX: box left y: box top w: box width h: box height) ifNil:[
		"Failed to set the buffer rect. Destroy the receiver and start over."
		self destroy.
		^nil].
	"We did change the buffer rect; make sure our target is up to date"
	bufRect := box.
	^self