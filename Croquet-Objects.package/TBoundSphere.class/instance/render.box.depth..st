render
render: ogl box: frm depth: depth

	children ifNotNil:[
		vertices ifNil: [ children do:[ :c | c render: ogl box: frm depth: depth-1. ].].].
	depth = 0 ifTrue:[ box ifNotNil:[
		frm render: ogl box: self box.].].