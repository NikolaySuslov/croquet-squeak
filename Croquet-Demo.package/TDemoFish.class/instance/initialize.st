initialize
initialize
	super initialize.
	overMaterial := TMaterial new.
	overMaterial color: #(1 1 0 1).
	downMaterial := TMaterial new.
	downMaterial color: #(0 0 1 1).
	normalMaterial := TMaterial new.
	normalMaterial color: #(1 1 1 1).
	speed := (1 to: 5) atRandom/5.0.
	(self future: (100 atRandom + 100))move.
