drawing
mouseMove: evt
	"In the middle of drawing a stroke.  6/11/97 19:51 tk"

	| pt priorEvt |

	WorldState canSurrenderToOS: false.		"we want maximum responsiveness"
	pt := evt cursorPoint.
	priorEvt := self lastEvent.
	(priorEvt ~~ nil and: [pt = priorEvt cursorPoint]) ifTrue: [^ self].
	self perform: (palette action) with: evt.
		"Each action must do invalidRect:"
	self lastEvent: evt.
	false ifTrue: ["So senders will find the things performed here"
		self paint: nil; fill: nil; erase: nil; pickup: nil; stamp: nil.
		self rect: nil; ellipse: nil; polygon: nil; line: nil; star: nil].