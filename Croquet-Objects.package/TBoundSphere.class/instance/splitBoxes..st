construct
splitBoxes: bx

	| epsilon ratio boxes splitBoxes extent |
" Split along the axis where the ratio with the other axes is greater than 0.6. I am sure there is a more efficient number. Just don't know what it is."

"	ratio := 0.737."
	ratio := 0.6.
	extent := bx extent.

" Make sure we don't divide by zero. "
	epsilon := 0.000001.
	extent := extent max: (Vector3 x: epsilon y: epsilon z: epsilon).
	boxes := OrderedCollection new.
	boxes add: bx.

	(((extent x/extent y) > ratio) and:[(extent x/extent z) > ratio]) ifTrue:[ 
		splitBoxes := OrderedCollection new.
		boxes do:[:b | 
			splitBoxes add: b splitXMin.
			splitBoxes add: b splitXMax.
			].
		boxes := splitBoxes.
		].

	(((extent y/extent x) > ratio) and:[(extent y/extent z) > ratio]) ifTrue:[ 
		splitBoxes := OrderedCollection new.
		boxes do:[:b | 
			splitBoxes add: b splitYMin.
			splitBoxes add: b splitYMax.
			].
		boxes := splitBoxes.
		].

	(((extent z/extent x) > ratio) and:[(extent z/extent y) > ratio]) ifTrue:[ 
		splitBoxes := OrderedCollection new.
		boxes do:[:b | 
			splitBoxes add: b splitZMin.
			splitBoxes add: b splitZMax.
			].
		boxes := splitBoxes.
		].

	^ boxes.