render
renderFrame: ogl parent: parent root: root

	changed ifTrue:[self updateBox. changed := false.].
	^ super renderFrame: ogl parent: parent root: root.