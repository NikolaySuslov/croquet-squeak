mini ball
mtfBall: aCollection
	"Create a minimum enclosing sphere from aCollection of points.
	See Emo Welzl, 'Smallest enclosing disks (balls and ellipsoids)' (1991),
	H. Maurer (Ed.), New Results and New Trends in Computer Science, LNCS 555
	http://citeseer.nj.nec.com/welzl91smallest.html"
	| border idxList |
	idxList := WordArray new: aCollection size.
	1 to: idxList size do:[:i| idxList at: i put: i].
	self privateMtfRandomize: idxList.
	border := Array new: 4.
	self privateMtfBall0: aCollection with: idxList with: 1 with: border.
	radius := radiusSquared sqrt.

	box := TBox new.
	aCollection do:[ :v | box growVertex:(v).].