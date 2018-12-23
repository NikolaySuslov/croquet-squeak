construct
frame: frm

	frame := frm.
	children ifNotNil:[ vertices ifNil:[ 
		children do:[:c | c frame: frm.].].].