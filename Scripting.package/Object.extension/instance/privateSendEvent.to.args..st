*Scripting-Extensions
privateSendEvent: anEvent to: aBlock args: nArgs
	"Private. Send an event to the block given the number of block arguments"
	nArgs = 0 ifTrue:[^aBlock value].
	nArgs = 1 ifTrue:[^aBlock value: anEvent].
	nArgs = 2 ifTrue:[^aBlock value: anEvent value: self].
	self error:'0-2 argument block expected'