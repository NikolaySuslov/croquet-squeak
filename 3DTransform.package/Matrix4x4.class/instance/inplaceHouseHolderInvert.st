solving
inplaceHouseHolderInvert
	"Solve the linear equation self * aVector = x by using HouseHolder's transformation.
	Note: This scheme is numerically better than using gaussian elimination even though it takes
	somewhat longer"
	| d x sigma beta sum s|
	<primitive:'primitiveInplaceHouseHolderInvert' module:'CroquetPlugin'>
	x := Matrix4x4 identity.
	d := Matrix4x4 new.
	1 to: 4 do:[:j|
		sigma := 0.0.
		j to: 4 do:[:i| sigma := sigma + ((self at: i at: j) squared)].
		sigma isZero ifTrue:[^nil]. "matrix is singular"
		((self at: j at: j) < 0.0) 
			ifTrue:[ s:= sigma sqrt]
			ifFalse:[ s:= sigma sqrt negated].
		1 to: 4 do:[:r| d at: j at: r put: s].
		beta := 1.0 / ( s * (self at: j at: j) - sigma).
		self at: j at: j put: ((self at: j at: j) - s).
		"update remaining columns"
		j+1 to: 4 do:[:k|
			sum := 0.0.
			j to: 4 do:[:i| sum := sum + ((self at: i at: j) * (self at: i at: k))].
			sum := sum * beta.
			j to: 4 do:[:i| 
				self at: i at: k put: ((self at: i at: k) + ((self at: i at: j) * sum))]].
		"update vector"
		1 to: 4 do:[:r|
			sum := nil.
			j to: 4 do:[:i| 
				sum := sum isNil 
					ifTrue:[(x at: i at: r) * (self at: i at: j)] 
					ifFalse:[sum + ((x at: i at: r) * (self at: i at: j))]].
			sum := sum * beta.
			j to: 4 do:[:i| 
				x at: i at: r put:((x at: i at: r) + (sum * (self at: i at: j)))].
		].
	].
	"Now calculate result"
	1 to: 4 do:[:r|
		4 to: 1 by: -1 do:[:i|
			i+1 to: 4 do:[:j|
				x at: i at: r put: ((x at: i at: r) - ((x at: j at: r) * (self at: i at: j))) ].
			x at: i at: r put: ((x at: i at: r) / (d at: i at: r))].
	].
	self loadFrom: x.
	"Return receiver"