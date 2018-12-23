accessing
add: bndSph depth: dpth

" Adds the boundSphere to the octree/quadtree."

	| sphLoc |

	sphLoc := bndSph globalPosition.
	inBox growVertex: sphLoc.
	outBox := outBox unionBox: 
		(inBox unionSphere:bndSph globalPosition radius: bndSph radius).
	radius := outBox diagonal/2.0.
	center := outBox center.
"------ This is as deep as we go - add the sphere -------"
	dpth = 0 ifTrue:[ 
		self addSphere: bndSph.
 		^ true. 
		].

"------ Will the sphere fit into this quad? ------"
	bndSph radius > (quadSize/2.0) ifTrue:[ 
 		self addSphere: bndSph. 
		^ true.	
		].

"------ Then which quad should it go into? ------ "

	sphLoc x < center x ifTrue:[
		sphLoc z < center z ifTrue:[ 
			qtTL ifNil:[ qtTL :=TQuadTree new initializeWithCorner: quadCorner size: quadSize depth: depth.].
			^ qtTL add: bndSph depth: (dpth-1).
			].
		qtBL ifNil:[ 
			qtBL := TQuadTree new initializeWithCorner: (quadCorner+(Vector3 x:0 y:0 z:quadSize)) size: quadSize depth: depth.].
			^ qtBL add: bndSph depth: (dpth-1).
		].
	sphLoc z < center z ifTrue:[
		qtTR ifNil:[ 
			qtTR :=TQuadTree new initializeWithCorner: (quadCorner+(Vector3 x:quadSize y:0 z:0)) size: quadSize depth: depth.].
		^ qtTR add: bndSph depth: (dpth-1).
		].
	qtBR ifNil:[
		qtBR :=TQuadTree new initializeWithCorner: (quadCorner+(Vector3 x:quadSize y:0 z:quadSize)) size: quadSize depth: depth.].
	^ qtBR add: bndSph depth: (dpth-1).
	