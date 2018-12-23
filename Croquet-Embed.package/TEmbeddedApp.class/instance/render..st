render
render: ogl
	"We're visible; update the step rate"
	stepRate := onscreenRate.
	^super render: ogl