construct
calcTree: verts faces: faces box: bx depth: depth

	| child faceBox boxes flist |

" See TBoundSphere >>#calcTree:faces:depth for more info."

	vertices := nil.
	(depth = 0 or:[ faces size <= 12])ifFalse:[
	"depth = 0 ifFalse:["
		boxes := self splitBoxes: bx.
" Calculate the list of faces that overlap each box, and recurse."
		boxes do:[:b |
			flist := OrderedCollection new.
			1 to: faces size by:3 do:[:i |
				(b intersectV1: (verts at:1+(faces at: i)) 
					V2:(verts at: 1+(faces at: i+1)) 
					V3:(verts at: 1+(faces at: i+2))) ifTrue:[
						flist add: (faces at: i).
						flist add: (faces at: i+1).
						flist add: (faces at: i+2).].].
			flist size > 1 ifTrue:[
				faceBox := TBox new.
				flist do:[:f | faceBox growVertex: (verts at: 1+f).].
				faceBox := faceBox intersectBox: b.
				child := (TBoundSphere calcTree: verts faces: flist box: faceBox depth: depth-1).
				child children ifNotNil:[self addChild: child].					
				].].]
	ifTrue:[
		vertices := verts. 
		children := faces asIntegerArray. 
		].

" Now calculate the minimal bounding sphere. We do it this way because the polygons actually overlap between boxes. If we were to use the mtfBall approach, the resulting radius could well be larger than this one."
	self box: bx.
	self localPosition: bx center radius: bx diagonal/2.0.
	vertices ifNotNil:[self calcSurface: verts faces: faces.].

				
		

	