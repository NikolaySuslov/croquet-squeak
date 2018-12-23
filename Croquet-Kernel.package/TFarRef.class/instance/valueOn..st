accessing
valueOn: anIsland
	"Answer the object/value I would have on the given island"
	anIsland == myIsland ifTrue:[^myValue] ifFalse:[^self].