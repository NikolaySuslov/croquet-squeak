hierarchy
boundSpheresDo: aBlock
	| bSphere |
	bSphere := self boundSphere.
	bSphere ifNotNil:[^aBlock value: bSphere].
	frameChildren ifNil:[^self].
	self frameChildren do:[:each| each boundSpheresDo: aBlock].
