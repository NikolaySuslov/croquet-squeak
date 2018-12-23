message sends
send: aBlock
	"Evaluate aBlock with a FarRef to the receiver which allows relaying immediate messages"
	^aBlock value: (TMessageMaker new setTarget: self)