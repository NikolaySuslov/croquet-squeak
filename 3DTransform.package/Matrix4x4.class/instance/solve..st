solving
solve: aVector

	^self shallowCopy inplaceHouseHolderTransform: aVector
	"or:
	^self clone inplaceDecomposeLU solveLU: aVector
	"