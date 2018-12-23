access
sumFaces
	| total |

" Returns the number of faces in the leaves."
	children ifNil:[^ 0].
	vertices ifTrue:[^children size/3].
	total := 0.
	children do:[:c | total := total + c sumFaces.].
	^total.