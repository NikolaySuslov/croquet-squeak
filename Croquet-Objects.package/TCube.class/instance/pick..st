render
pick: pointer

	| base |
	base := 1.
	1 to: 6 do: [:i |	
		(pointer 
			pickQuad: (normalBuffer at: base)
			q1: (vertexBuffer at: base)
			q2: (vertexBuffer at: base+1)
			q3: (vertexBuffer at: base+2)
			q4: (vertexBuffer at: base+3)) ifTrue: [
		^ true].
		base := base+4.].
	^ false

 	"*** The above is a slighty CSE-optimized version of this original: 
	1 to: 6 do: [:i |
		(pointer 
			pickQuad: (normalBuffer at: 4*(i-1)+1)
			q1: (vertexBuffer at: 4*(i-1)+1)
			q2: (vertexBuffer at: 4*(i-1)+2)
			q3: (vertexBuffer at: 4*(i-1)+3)
			q4: (vertexBuffer at: 4*(i-1)+4)) ifTrue: [^ true]].
	^ false
	*** "