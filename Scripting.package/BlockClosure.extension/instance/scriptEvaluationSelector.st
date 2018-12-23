*Scripting-Extensions
scriptEvaluationSelector
	"Answer the right selector to evaluate the receiver when converted to a script, or nil if there isn't one."
	^numArgs <= 4 ifTrue:
		[#(	evaluate:
			evaluate:with:
			evaluate:with:with:
			evaluate:with:with:with:
			evaluate:with:with:with:with:) at: numArgs + 1]