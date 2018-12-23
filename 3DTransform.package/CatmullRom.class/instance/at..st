compute
at: t

	| t2 t3 |
	t2 := t*t.
	t3 := t2 *t.
	^ p1 + (p2 * t) + (p3 *t2) + (p4 * t3).