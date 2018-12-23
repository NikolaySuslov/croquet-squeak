drawing
mouseEnter: evt
	"Set the cursor.  Reread colors if embedded editable polygon needs it."

	| poly cColor |
	super mouseEnter: evt.
	"evt hand showTemporaryCursor: palette plainCursor."
	palette getSpecial == #polygon: ifFalse: [^self].
	(poly := self valueOfProperty: #polygon) ifNil: [^ self].
	cColor := palette getColor.
	poly color: cColor; borderWidth: 1.
	poly changed.