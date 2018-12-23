parse
makeNodeName: tree

	| field fieldName name start end |
	tree linksDo:[ :node |
		fieldName := node name.
		fieldName = #TNodeName ifTrue:[
			field := node value.
			start := field findDelimiters: '"' startingAt: 1.
			end := field findDelimiters: '"' startingAt: start+1.
			name := (field copyFrom: start+1 to: end-1).
			].
		].
	^ name.
		