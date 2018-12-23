*HedgeHacks-Painter
traceOutline: refColor do: aBlock
	"Trace the outline edges in the receiver and evaluate aBlock with all the pixels"
	| rect x y pixelOffsets startPos lastPos pixDir nextPos refValue peeker |
	peeker := BitBlt bitPeekerFromForm: self.
	refValue := self pixelValueFor: refColor.
	pixelOffsets := {1@0. 1@1. 0@1. -1@1. -1@0. -1@-1. 0@-1. 1@-1}.
	"Find the smallest enclosing rectangle"
	rect := self rectangleEnclosingPixelsNotOfColor: refColor.
	"Find a pixel which is non-transparent"
	y := rect top. x := rect left.
	[x < rect right] whileTrue:[
		(self safePixelAt: x@y using: peeker) = refValue ifFalse:[
			startPos := x@y.
			x := rect right].
		x := x + 1.
	].
	startPos ifNil:[^self]. "this image is entirely transparent"
	nextPos := startPos.
	pixDir := 1. "we always start pointing to the right"
	[
		aBlock value: nextPos.
		lastPos := nextPos.
		"Search for a new pixel not of refColor at lastPos.
		Start with the last direction turned 90° left"
		pixDir := pixDir - 3 \\ 8 + 1.
		[nextPos := lastPos + (pixelOffsets at: pixDir).
		(self safePixelAt: nextPos using: peeker) = refValue] whileTrue:[
			"Turn left until we find something"
			pixDir := pixDir + 1 \\ 8 + 1.
		].
	nextPos = startPos] whileFalse.