hierarchy
collapse

"Forces all frames to identity transform while retaining translation, and pushes the previous transform to the frame children. This is used primarily for meshes and their supporting groups."
	| orient trans |

	trans := self translation.
	orient := self orientation.
	frameChildren ifNotNil:[ 
		frameChildren do:[ :fc |  
			fc localTransform: (orient * fc localTransform).
			fc collapse.
		].
	].
	self localTransform: Matrix4x4 identity.
	self translation: trans.
