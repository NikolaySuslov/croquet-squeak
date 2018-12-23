initialize
endFrame
	self cleanup.
"	'Max: ', memUsed asStringWithCommas displayAt: 0@0.
	'Now: ', memFrame asStringWithCommas displayAt: 0@15.
	Display forceToScreen: (0@0 extent: 100@30).
"