initialize
boundSphere
	| vbox bb |
	boundsChanged ifTrue:[
		boundBox := positionRange copy.
		vbox := velocityRange copy.
		lifetimeRange max timesRepeat:[
			bb := boundBox addBox: (vbox * 0.001).
			boundBox := boundBox unionBox: bb.
			vbox := vbox addBox: (accelerationRange * 0.001).
			].
		boundSphere := TBoundSphere localPosition: boundBox center radius: (boundBox diagonal/2.0).
		boundSphere frame: self.
		boundsChanged := false.
		].
	^ boundSphere.