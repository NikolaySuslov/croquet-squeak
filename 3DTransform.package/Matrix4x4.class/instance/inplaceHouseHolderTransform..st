solving
inplaceHouseHolderTransform: aVector
	"Solve the linear equation self * aVector = x by using HouseHolder's transformation.
	Note: This scheme is numerically better than using gaussian elimination even though it takes
	somewhat longer"
	| d x sigma beta sum s|
	x := Array with: aVector x with: aVector y with: aVector z with: aVector w.
	d := Array new: 4.
	1 to: 4 do:[:j|
		sigma := 0.0.
		j to: 4 do:[:i| sigma := sigma + ((self at: i at: j) squared)].
		sigma isZero ifTrue:[^nil]. "matrix is singular"
		((self at: j at: j) < 0.0) 
			ifTrue:[ s:= d at: j put: (sigma sqrt)]
			ifFalse:[ s:= d at: j put: (sigma sqrt negated)].
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
		sum := nil.
		j to: 4 do:[:i| 
			sum := sum isNil 
				ifTrue:[(x at: i) * (self at: i at: j)] 
				ifFalse:[sum + ((x at: i) * (self at: i at: j))]].
		sum := sum * beta.
		j to: 4 do:[:i| 
			x at: i put:((x at: i) + (sum * (self at: i at: j)))].
	].
	"Now calculate result"
	4 to: 1 by: -1 do:[:i|
		i+1 to: 4 do:[:j|
			x at: i put: ((x at: i) - ((x at: j) * (self at: i at: j))) ].
		x at: i put: ((x at: i) / (d at: i))].
	^Vector4 x: (x at: 1) y: (x at: 2) z: (x at: 3) w: (x at: 4)
