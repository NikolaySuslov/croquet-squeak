painting
undo: evt
	"revert to a previous state.  "

	| temp poly |

	self flag: #bob.		"what is undo in multihand environment?"
	undoBuffer ifNil: [^ self beep].	"nothing to go back to"
	(poly := self valueOfProperty: #polygon) ifNotNil:
		[poly delete.
		self setProperty: #polygon toValue: nil.
		^ self].
	temp := paintingForm.
	paintingForm := undoBuffer.
	undoBuffer := temp.		"can get back to what you had by undoing again"
	(self paintingFormPen ) setDestForm: paintingForm.
	formCanvas := paintingForm getCanvas.	"used for lines, ovals, etc."
	formCanvas := formCanvas
		copyOrigin: self topLeft negated
		clipRect: (0@0 extent: bounds extent).
	self render: bounds.