render
pickChildren: pointer

	| rval |

" This method exists to avoid testing the top-most sphere twice. It is just a special case of the #pick: method. Notice the commented out code."

"	(pointer pickLocalBoundSphere: self)ifTrue:["
	vertices ifNotNil:[^pointer pickTriangles: vertices list: children].
	rval := false.
	children do:[:c | rval := (c pick: pointer) or:[ rval]. ].
	^ rval