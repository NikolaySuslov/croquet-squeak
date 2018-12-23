initialize
name: aString actionBlock: aBlock cancelBlock: altBlock

	theName := aString.
	actionBlock := aBlock.
	cancelBlock := altBlock.
	theNameMorph contentsWrapped: theName.
	theNameMorph editor selectAll.