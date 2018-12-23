mini ball
privateMtfBall0: pointList with: indexList with: minIndex with: borderList
	"Note: In this variant the default recursion path is inlined. The recursion exclusively affects changes of the border vertices so its depth is bounded by the max. number of vertices on the border (which is four)."
	| idx p dist2 index |
	localPosition := Vector3 new.
	radiusSquared := -1.0.
	index := indexList size.
	[index >= minIndex] whileTrue:[
		idx := indexList at: index.
		p := pointList at: idx.
		p := p - localPosition.
		dist2 := (p dot: p) * 0.999. "numerical accuracy"
		dist2 <= radiusSquared ifFalse:[
			p := pointList at: idx.
			borderList at: 1 put: p.
			self privateMtfBall1: pointList with: indexList with: index+1 with: borderList.
			"Move p to front"
			indexList replaceFrom: index to: indexList size-1 with: indexList startingAt: index+1.
			indexList at: indexList size put: idx.
		].
		index := index - 1.
	].