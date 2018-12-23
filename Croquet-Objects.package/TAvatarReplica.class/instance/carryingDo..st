accessing
carryingDo: aBlock

	carrying ifNil:[^self].
	^carrying frameChildren do: aBlock
