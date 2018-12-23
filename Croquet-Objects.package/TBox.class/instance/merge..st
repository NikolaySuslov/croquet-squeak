accessing
merge: aBox
	"Answer a Box that contains both the receiver and aBox."

	^TBox 
		origin: (self origin min: aBox origin)
		corner: (self corner max: aBox corner)