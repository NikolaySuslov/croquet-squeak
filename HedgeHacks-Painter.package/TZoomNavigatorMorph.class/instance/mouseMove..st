event handling
mouseMove: anEvent
	| xPos rightMorph leftMorph leftFraction rightFraction deltaX leftExtent rightExtent |

	(self containsPoint: anEvent position) ifFalse:[
		scroller submorphsDo:[:m| m extent: self smallExtent].
	].
	"Figure out where we are"
	xPos := anEvent position x.
	"See if we need to scroll"
	scrollValue := nil.
	deltaX := (xPos - bounds left) max: 0.
	deltaX < self largeExtent x ifTrue:[
		scroller left < bounds left ifTrue:[
			scrollValue := self largeExtent x - deltaX // 8.
		].
	].
	deltaX := (bounds right - xPos) max: 0.
	deltaX < self largeExtent x ifTrue:[
		scroller right > bounds right ifTrue:[
			scrollValue := self largeExtent x - deltaX // -8.
		].
	].


	rightMorph := scroller submorphs detect:[:m| m center x > xPos] ifNone:[nil].
	rightMorph ifNil:[
		"We're at the right most point"
		leftMorph := nil.
		leftFraction := 0.0.
		rightMorph := scroller lastSubmorph.
		rightFraction := 1.0.
	] ifNotNil:[
		rightMorph == scroller firstSubmorph ifTrue:[
			"Left-most"
			leftMorph := rightMorph.
			leftFraction := 1.0.
			rightMorph := nil.
			rightFraction := 0.0.
		] ifFalse:[
			"somewhere inbetween"
			leftMorph := scroller submorphs at: (scroller submorphs indexOf: rightMorph)-1.
			deltaX := rightMorph center x - leftMorph center x.
			rightFraction := xPos - leftMorph center x / deltaX asFloat.
			leftFraction := 1.0 - rightFraction.
		].
	].
	leftExtent := self smallExtent + (self largeExtent - self smallExtent * leftFraction) asIntegerPoint.
	rightExtent := self smallExtent + (self largeExtent - self smallExtent * rightFraction) asIntegerPoint.
	scroller submorphsDo:[:m|
		m == leftMorph 
			ifTrue:[m extent: leftExtent]
			ifFalse:[m == rightMorph 
				ifTrue:[m extent: rightExtent]
				ifFalse:[m extent: self smallExtent]]].
