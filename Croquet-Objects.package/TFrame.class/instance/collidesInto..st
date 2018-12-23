events
collidesInto: aFrame
	"Answer whether I collide into the given frame"
	| mySphere itsSphere |
	mySphere := self compositeBoundSphere ifNil:[^false].
	itsSphere := aFrame compositeBoundSphere ifNil:[^false].
	^mySphere collideSphere: itsSphere