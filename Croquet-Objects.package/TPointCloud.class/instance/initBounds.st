initialize
initBounds

	vertices ifNil: [
		boundSphere := TBoundSphere new.
		boundSphere localPosition: Vector3 new.
		boundSphere radius: 1.0.
		boundSphere frame: self.
		]
	ifNotNil: [
		Transcript show: 'Calculating bounding box point by point....';cr.
		box := TBox new.
		vertices do: [:v|
			box growVertex: v
			].
		vertices do: [:v|
			v -= box center.
			].
		box := TBox new.
		vertices do: [:v|
			box growVertex: v
			].

		boundSphere := TBoundSphere new.
		boundSphere localPosition: box center.
		boundSphere radius: (box radius * 0.5).
		boundSphere frame: self.
		boundSphere box: box.
		
		].
