access
sumNodes
	| total |

" Returns the total number of nodes in the tree."
	children ifNil:[^ 1].
	vertices ifNotNil:[^1].
	total := 1.
	children do:[:c | total := total + c sumNodes.].
	^total.