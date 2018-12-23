render
pick: pointer

	| rval |

" There is a problem here. I do not have the norm for these faces, which means that this will
 allow us to pick a triangle on the wrong side of the object. This must be fixed.

Another thing that needs to be looked at is just because we find a triangle to pick does NOT mean that there isn't a closer one. This code exits on the very first triangle - but I am leaving it -as is- for performance reasons. To fix it, look at the next 'clause', where I had the same problem with groups of polys."

	(pointer pickLocalBoundSphere: self) ifFalse:[^false].
	vertices ifNotNil:[^pointer pickTriangles: vertices list: children].
	rval := false.
	children ifNotNil: [children do:[:c | rval := (c pick: pointer) or:[ rval]. ]].
	^rval.		
