driving
takeMeTo: selection orientation: orientation

	"Take the user towards the given selection.
	 Orientation is the orientation of the pointer at the time of the pick 
      that produced the selection."

	| frame distance xform y tran vector |

	frame := selection frame.
	frame ifNotNil: [
		"Rule out picks of the space itself, and of the avatar."
		(frame = self) ifTrue: [^self].
		(frame hasAncestor: self) ifTrue:[^ self]. 
		(frame root = self root) ifFalse:[^self]. 	
	].

	selection globalPoint ifNil: [ ^ self ].

	"Determine the destination.
	 We don't move all the way to the selection point.
	 Rather we move at most 4/5 of the way to it,
	 and we never move closer to it than our own height away.
	 Normal movement can be used for finer motion"

	distance := self translation distanceTo: selection globalPoint.
	distance := ((4 * distance) / 5) min: (distance - self extent y).

	"Limit the jump to 8x my height (empirical) to mediate against skybox jumps;
	 this is a workaround until there's a better way of making some things unpickable."

	distance := distance min: (self extent y * 8).

	(distance <= 0) ifTrue: [
		^ self
	].
	vector := (selection globalPoint - self translation) length: distance.   

	"For now, fix 'y' during these goTo: translations; this will be
      inappropriate for spaces without flat grounds."

	xform := orientation copy.
	y := self translation y.
	tran := self translation + vector.
	xform translation: (tran x)@y@(tran z).
	gotoTransform := xform.
	gotoCount := 6.
	self doGoto.
