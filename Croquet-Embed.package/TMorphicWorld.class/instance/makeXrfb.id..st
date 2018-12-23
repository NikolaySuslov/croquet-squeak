initialize
makeXrfb: uri id: id
	| morph |
	morph := XrfbClient url: uri objectID:  id.
 	self makeWorld: morph.

	"This kludge does two things:
	1. Makes the dimensions of the rfb window (in morphic space) within the client match
	the dimensions provided by the server (800x600).
	2. Shows us only that rfb window, without the morphic title bar or the client scrolls 
	(which would never be used because the rfb window is 1:1 with what the server is 
	providing).
	"
	morph bounds: (Rectangle origin: -20@-20 corner: extent + (20@40)). 