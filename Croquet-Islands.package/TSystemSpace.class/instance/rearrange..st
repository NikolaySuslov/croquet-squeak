initialize
rearrange: ogl

	frameChildren ifNotNil:[
		frameChildren do:[ :fc | fc rearrange: ogl].].
"corners ifNil:[^self].
	cornerVector ~= ogl camera cornerVector ifTrue:[
		cornerVector := ogl camera cornerVector.
		vec := cornerVector*8.
		(corners at:1) translation: vec.
		(corners at:2) translation: vec x@ vec y negated@vec z.
		(corners at:3) translation: vec x negated@vec y negated@vec z.
		(corners at:4) translation: vec x negated@vec y@vec z.
	]."