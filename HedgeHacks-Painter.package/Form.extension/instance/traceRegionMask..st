*HedgeHacks-Painter
traceRegionMask: points
	"Create a mask for the region inside points"
	| min max mask poker |
	min := points min.
	max := points max.
	"tag all the points in the outline"
	mask := Form extent: (max - min)+3 depth: 1.
	mask offset: min-1.
	poker := BitBlt bitPokerToForm: mask.
	points do:[:pt| poker pixelAt: pt - mask offset put: 1].
	"floodfill the outside area (needs border!)"
	mask floodFill: Color black at: 0@0.
	"clean out the pixels already marked (do we need this???)"
	points do:[:pt| poker pixelAt: pt - mask offset put: 0].
	"reverse maskForm to mask out pixels not belonging to original"
	mask reverse.
	^mask