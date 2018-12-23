accessing
hand
	^((self valueOfProperty: #hand) valueOn: island) ifNil:[self island project primaryHand].