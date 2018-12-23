comparing
axisTestYv1: v1 v2: v2 a: a b: b fa: fa fb: fb

	| p0 p1 min max rad |

	p0 := (b * v1 z) - (a * v1 x).
	p1 := (b * v2 z) - (a * v2 x).
	p0 < p1 ifTrue:[min := p0. max := p1.] ifFalse:[min := p1. max := p0.].
	rad := ((fa * self extentX) + (fb * self extentZ))/2.0.
	(min > rad or:[max < (rad negated)]) ifTrue:[^ false.].
	^ true.