accessing
hand: aHand
	^self setProperty: #hand toValue: (aHand ifNotNil:[island asFarRef: aHand])