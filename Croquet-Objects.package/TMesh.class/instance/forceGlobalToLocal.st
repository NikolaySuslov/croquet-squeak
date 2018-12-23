accessing
forceGlobalToLocal

"This is used by TMesh where we assume that the imported vertices are pre-transformed and we want to put them back into their untransformed state. Only TMesh will probably need this, but TMeshes can have TGroups which don't know what to do."
	| invMat invOrient verts norms |

	frameChildren ifNotNil:[ frameChildren do:[ :fc | fc forceGlobalToLocal.]].
	invMat := self localTransform orthoNormInverse.
	invOrient := self orientation orthoNormInverse.
	(verts := self vertices) withIndexDo: [:v :ind |
		verts at: ind put: (invMat localPointToGlobal: v)].
	(norms := self normals) withIndexDo: [:n :ind |
		norms at: ind put: (invOrient localPointToGlobal: n)].
	frameParent ifNotNil:[
		self localTransform: (
			frameParent localTransform orthoNormInverse composeWith: self localTransform).
		].
