accessing
updateList: ogl
	updateList size= 0 ifTrue:[^self].
	ogl updateTextures: updateList.
	updateList := OrderedCollection new.