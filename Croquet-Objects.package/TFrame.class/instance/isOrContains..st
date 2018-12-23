hierarchy
isOrContains: aFrame

	"Is the given frame either myself or a descendant of myself?"

	^ (aFrame == self) or: [ aFrame hasAncestor: self ].
