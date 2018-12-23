accessing
cornerVerticesDo: aBlock
	"Evaluate aBlock with all the vertices defining the corners of this block"
	| min max |
	min := minCorner.
	max := maxCorner.
	aBlock value: min x @ min y @ min z.
	aBlock value: min x @ min y @ max z.
	aBlock value: min x @ max y @ min z.
	aBlock value: min x @ max y @ max z.
	aBlock value: max x @ min y @ min z.
	aBlock value: max x @ min y @ max z.
	aBlock value: max x @ max y @ min z.
	aBlock value: max x @ max y @ max z.
