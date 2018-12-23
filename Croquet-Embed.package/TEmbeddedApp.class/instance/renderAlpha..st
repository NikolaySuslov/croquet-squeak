render
renderAlpha: ogl
	"We're visible; update the step rate"
	stepRate := onscreenRate.
	^super renderAlpha: ogl