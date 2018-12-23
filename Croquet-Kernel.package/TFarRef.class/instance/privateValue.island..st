private
privateValue: anObject island: anIsland
	(myIsland == nil or:[myIsland == anIsland])
		ifFalse:[^self error:'Cannot change farRef island'].
	(myValue == nil or:[myValue == self or:[myValue == anObject]]) 
		ifFalse:[^self error:'Cannot change farRef value'].
	myValue := anObject.
	myIsland := anIsland.
	self pvtController.