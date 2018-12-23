convert
makeHelperObject: tree

	| field fieldName name start end |
	tree linksDo:[ :node |  "Now linked list for performance"
		fieldName := node name.
		field := node value.
		fieldName = #TNodeName ifTrue:[
			start := field findDelimiters: '"' startingAt: 1.
			end := field findDelimiters: '"' startingAt: start+1.
			name := (field copyFrom: start+1 to: end-1).
			].
		fieldName = #TNodeTm ifTrue:[
			transform := self makeTransform: field.
			].
		].
	^ name.
		