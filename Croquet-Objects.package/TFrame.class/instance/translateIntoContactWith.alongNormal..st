transform
translateIntoContactWith: aPoint alongNormal: norm

	"Adjust my frame translation to be 'in contact' with the given point, such that:
	 the given point touches my bounding box,
       and the normal from the point passes through my origin.
	 The point and normal are in my parent's frame of reference.

	 This is used for spatial drag and drop."

	| box offset |

	"For visually correct-looking results, we need to work with the bounding box,
      rather than the frame origin and boundSphere, since nontrivial models are
      rarely spheroid or balanced around the origin."

	box := self boundingBox transformedBy: (self orientation).

	offset := (
		(norm x > 0 ifTrue: [box min x negated] ifFalse: [box max x]) @
		(norm y > 0 ifTrue: [box min y negated] ifFalse: [box max y]) @
		(norm z > 0 ifTrue: [box min z negated] ifFalse: [box max z])).

	offset := offset * norm.   	"Offset is now the offset for the box center along the normal."
	
	self translation: aPoint - box center + (box center * norm) + offset.


