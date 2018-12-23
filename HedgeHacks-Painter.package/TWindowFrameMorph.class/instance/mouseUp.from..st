events
mouseUp: evt from: aButton
	aButton borderColor: #raised.
	(aButton containsPoint: evt position) ifTrue:[aButton signal: #fire].