collision
collideSphere: aSphere
	"Answer whether I collilde into aSphere."
	| myPos itsPos dist pt |
	"Note: For some reason the global position of some spheres is broken. E.g.,
		(frame globalTransform localPointToGlobal: localPosition) distanceTo: globalPosition.
	is NOT zero."
	myPos := self frame globalTransform localPointToGlobal: localPosition.
	itsPos := aSphere frame globalTransform localPointToGlobal: localPosition.
	dist := myPos - itsPos.
	dist := dist dot: dist.
	dist > (self radiusSquared + aSphere radiusSquared) ifTrue:[^nil]. "no intersection"
	"The global spheres intersect. If I have any local spheres, then recurse into them."
	normal ifNil:[ children ifNotNil:[ children size > 0 ifTrue:[
		children do:[:each|
			pt := each collideSphere: aSphere.
			pt ifNotNil:[^pt].
		].
		^nil.
	]]].
	"I am a leaf sphere"
	aSphere isLeafSphere ifTrue:[
		"It's a leaf sphere as well. Answer an approximate collision point (not accurate!)"
		^(self globalPosition + aSphere globalPosition) * 0.5.
	].
	"Otherwise have the other sphere collide"
	^aSphere collideSphere: self.