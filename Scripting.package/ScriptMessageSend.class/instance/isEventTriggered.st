testing
isEventTriggered
	"Am I triggered by some event?"
	^eventSpec notNil and:[eventSpec size >= 2]