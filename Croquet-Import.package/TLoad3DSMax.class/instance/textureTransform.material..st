convert
textureTransform: tuv material: mat

	| uv |
	uv := tuv.
	mat texture ifNotNil:[
		"Magic mumbo jumbo goes here. Trial and error, and some intuition go a long way."
		uv := Point x: (uv x - 0.5 - mat uvOffset x) y: (uv y - 0.5 + mat uvOffset y).
		"uv := uv asPoint - 0.5 + mat uvOffset."
		mat uvAngle = 0.0 ifFalse:[
			uv := uv rotateBy: mat uvAngle about: 0@0.].
		uv := mat uvScale * uv + 0.5.
		].
	^ Vector2 x: uv x y: uv y.