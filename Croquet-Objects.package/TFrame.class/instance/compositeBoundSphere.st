accessing
compositeBoundSphere
	"Answer either my own or a composition of my children's bound spheres"
	| children bSphere |
	children := OrderedCollection new.
	self boundSpheresDo:[:bs|
		bSphere := bs union: bSphere.
		children add: bs.
	].
	children size = 0 ifTrue:[^nil].
	children size = 1 ifTrue:[^children first].
	bSphere children: children.
	bSphere frame: self.
	bSphere transform: self globalTransform.
	^bSphere
