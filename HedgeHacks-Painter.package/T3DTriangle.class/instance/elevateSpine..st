elevation
elevateSpine: nSteps
	"Elevate the receiver's spine"
	self isValid ifFalse:[^#()].
	self isJunction 
		ifTrue:[^self elevateJunction: nSteps].
	self isTerminal
		ifTrue:[^self elevateTerminal: nSteps].
	self isSleeve
		ifTrue:[^self elevateSleeve: nSteps].
	^#()