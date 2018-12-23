construct
union: sphere

" We calculate the minimal sphere that contains both this sphere and the argument sphere."

" This needs to be performed in global coordinates."

	| vector length norm p1 p2 |
	sphere ifNil:[ ^ TBoundSphere localPosition: (self globalPosition) radius: (self radius).].

	vector := sphere globalPosition - self globalPosition.
	vector length = 0.0 ifTrue:[
		^ TBoundSphere localPosition: (self globalPosition) radius: (self radius max: sphere radius).
		].
	length := vector length.
	norm := vector/length.
	length + sphere radius > self radius ifTrue:[ p2 := norm * (length + sphere radius).] 
		ifFalse:[ ^ TBoundSphere localPosition: (self globalPosition) radius: (self radius).].
	length + self radius > sphere radius ifTrue:[ p1 := norm * (self radius) negated ] 
		ifFalse:[ ^ TBoundSphere localPosition: (sphere globalPosition) radius: (sphere radius).].

	length := ((p1-p2) length)/2.0.
	p1 := ((p1+p2)/2.0) + self globalPosition.
	^ TBoundSphere localPosition: p1 radius: length.

	
