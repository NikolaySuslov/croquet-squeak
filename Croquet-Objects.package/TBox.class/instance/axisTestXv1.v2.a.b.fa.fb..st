comparing
axisTestXv1: v1 v2: v2 a: a b: b fa: fa fb: fb

	| p0 p1 min max rad |

	p0 := (a * v1 y) - (b * v1 z).
	p1 := (a * v2 y) - (b * v2 z).
	p0 < p1 ifTrue:[min := p0. max := p1.] ifFalse:[min := p1. max := p0.].
	rad := ((fa * self extentY) + (fb * self extentZ))/2.0.
	(min > rad or:[max < (rad negated)]) ifTrue:[^ false.].
	^ true.