accessing
octreeRadius
	| rad childRad |

" Find the max bound sphere radius of the tree. This is used for quadtree/octree construction "
	self boundSphere ifNotNil:[ rad := self boundSphere radius.] ifNil:[ rad := 0 ].
	frameChildren ifNotNil:[
		frameChildren do:[ :fc | 	
			
			childRad := fc octreeRadius.
			rad := rad max: childRad.
			].
		].

	^ rad.