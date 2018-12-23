accessing
octreeSieve: octree
	| bs |

	bs := self boundSphere.
	bs ifNotNil:[ 		
		bs transform: self globalTransform.
		octree add: bs. 
		].
	frameChildren ifNotNil:[
		frameChildren do:[ :fc | 	fc octreeSieve: octree. ].
		].
