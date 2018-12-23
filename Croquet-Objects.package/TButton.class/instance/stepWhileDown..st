stepping
stepWhileDown: event
	
	target ifNil:[ ^self ].
	action ifNil:[ ^self ].
	stepWhileDown ifTrue:[
	"only do this when the cursor is actually on the button."
	"	pointerOnTop ifTrue:["
		self fire: action target: target with: event.
	"]. "
		(self future: whileDownTime) stepWhileDown: event.
	].
