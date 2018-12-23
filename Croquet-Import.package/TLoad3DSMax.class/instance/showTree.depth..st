parse
showTree: tree depth: depth

	| label |
	tree class = OrderedCollection ifTrue:[
	1 to: tree size by: 2 do:[:i |
		1 to: depth do:[ :j | Transcript show:'---|'.].
		label := tree at: i.
		Transcript show: (tree at: i) asString; cr.
		label = #TMeshVertexList ifFalse:[
		label = #TMeshFaceList ifFalse:[
		label = #TMeshTvertlist ifFalse:[
		label = #TMeshTfacelist ifFalse:[
		label = #TSubmaterial ifFalse:[
		self showTree: (tree at:(i+1)) depth: depth+1.].].].].].].].
