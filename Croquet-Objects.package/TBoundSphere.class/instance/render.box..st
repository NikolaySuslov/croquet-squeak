render
render: ogl box: frm

	children ifNotNil:[
		vertices ifNil: [ children do:[ :c | c render: ogl box: frm].].].
	self box ifNotNil:[frm render: ogl box: self box].
