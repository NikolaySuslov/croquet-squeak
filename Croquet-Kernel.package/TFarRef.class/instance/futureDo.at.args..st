message sends
futureDo: aSelector at: deltaMSecs args: args
	"Send a message deltaSeconds into the future"
	| msgData encoder |
	deltaMSecs = 0 ifFalse:[^self error:'Cannot send timed external messages'].
	myName ifNil:[^self error: 'This object has no name'].
	msgData := TMessageData new.
	msgData receiver: myName.
	msgData selector: aSelector.
	encoder := TMessageEncoder new.
	encoder island: self island.
	encoder nextPut: args.
	msgData arguments: encoder contents.
	msgData time: deltaMSecs.
	self pvtController sendMessage: msgData.
	^nil