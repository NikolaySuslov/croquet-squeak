message sends
futureSend: aSelector at: deltaMSecs args: args
	"Send a message deltaSeconds into the future"
	| msgData encoder id promised | 

	deltaMSecs = 0 ifFalse:[^self error:'Cannot send timed external messages'].
	myName ifNil:[^self error: 'This object has no name'].
	id := (TObjectID for: aSelector).
	promised := TFarRef new.
	promised privateValue: promised island: myIsland.
	"@@@@: Check this - is this a potential race condition??? @@@@"
	myIsland register: promised name: id shallowCopy.
	msgData := TMessageData new.
	msgData receiver: myName.
	msgData selector: aSelector.
	encoder := TMessageEncoder new.
	encoder island: self island.
	encoder nextPut: args.
	msgData arguments: encoder contents.
	msgData id: id.
	msgData time: deltaMSecs.
	self pvtController sendMessage: msgData.
	^promised