drawing
mouseLeave: evt
	"Revert to the normal hand cursor."

	super mouseLeave: evt.
	evt hand showTemporaryCursor: nil.  "back to normal"
	"If this is modified to close down the SketchEditorMorph in any way, watch out for how it is called when entering a rotationButton and a scaleButton."
