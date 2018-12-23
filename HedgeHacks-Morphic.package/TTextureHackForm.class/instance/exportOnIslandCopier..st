fileIn/out
exportOnIslandCopier: copier
	| saved result |
	[saved := stepping.
	stepping := false.
	result := super exportOnIslandCopier: copier] ensure: [stepping := saved].
	^ result