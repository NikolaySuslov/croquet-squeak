accessing
center
	| pt1 pt2 pt3 l1 l2 l3 sum |
	pt1 := e1 center.
	pt2 := e2 center.
	pt3 := e3 center.
	l1 := e1 length.
	l2 := e2 length.
	l3 := e3 length.
	sum := l1 + l2 + l3.
	^((pt1 * l1) + (pt2 * l2) + (pt3 * l3)) / sum
	"^(p1 + p2 + p3) / 3.0"