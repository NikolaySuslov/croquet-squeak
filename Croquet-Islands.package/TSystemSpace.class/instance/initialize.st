initialize
initialize
	| light frame sphere mat |
	super initialize.
	light := TLight new.
	self addChild: light.
true ifTrue:[^self].
	corners := OrderedCollection new.
	4 timesRepeat:[
		frame := TSpinTest new.
		sphere := TSphere new.
mat := TMaterial new.
mat color: #(0.3 0.8 0.3 1).
		sphere material: mat.
		sphere radius: 0.5.
		frame addChild: sphere.
		self addChild: frame.
		frame translation:((10-(20 atRandom))@(10-(20 atRandom))@(-5-(20 atRandom))).
		frame addRotationAroundX: 360 atRandom.
		frame addRotationAroundY: 360 atRandom.
		frame addRotationAroundZ: 360 atRandom.
		corners add: frame.
	].
