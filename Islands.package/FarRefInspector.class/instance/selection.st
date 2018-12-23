accessing
selection
	"The receiver has a list of variables of its inspected object.
	One of these is selected. Answer the value of the selected variable."
	| basicIndex aClass |
	selectionIndex = 0 ifTrue: [^ ''].
	selectionIndex = 1 ifTrue: [^ object].
	selectionIndex = 2 ifTrue: [^ object longPrintString].
	aClass := self actualClassOf: object.
	(selectionIndex - 2) <= aClass instSize
		ifTrue: [^ object farInstVarAt: selectionIndex - 2].
	basicIndex := selectionIndex - 2 - aClass instSize.
	(object basicSize <= (self i1 + self i2)  or: [basicIndex <= self i1])
		ifTrue: [^ object basicAt: basicIndex]
		ifFalse: [^ object basicAt: object basicSize - (self i1 + self i2) + basicIndex]