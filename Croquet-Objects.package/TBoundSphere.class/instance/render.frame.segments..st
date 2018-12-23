render
render: ogl frame: frm segments: segs

	children ifNotNil:[
		vertices ifNil: [ children do:[ :c | c render: ogl frame: frm segments: segs. ].].].
	frm render: ogl sphere: self segments: segs.