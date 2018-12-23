as yet unclassified
makeTextEditor
	| editor |
	editor := PluggableTextMorph on: StringHolder new text: #contents accept: nil.
	editor extent: 512@256.
	^editor