accessing
contents3D: cont
	
	contents3D := true.
	self contents: cont.
	windowFrame doInside: true.
	self removeChild: rectBack.
