initialize
split: ind depth: dp
	 | c indexArray b1 b2 b3 b4 b5 b6|
	
	0 = (dp - 1) ifTrue: [
		surface1 at: sIndex put: (ind at: 1). 
		surface1 at: sIndex+1 put: (ind at: 2). 
		surface1 at: sIndex+2 put: (ind at: 3).

		surface2 at: sIndex put: (ind at: 1).
		surface2 at: sIndex+1 put: (ind at: 3). 
		surface2 at: sIndex+2 put: (ind at: 4).

		surface3 at: sIndex put: (ind at: 1). 
		surface3 at: sIndex+1 put: (ind at: 4). 
		surface3 at: sIndex+2 put: (ind at: 2).

		surface4 at: sIndex put: (ind at: 4). 
		surface4 at: sIndex+1 put: (ind at: 3). 
		surface4 at: sIndex+2 put: (ind at: 2). 
		sIndex := sIndex+3.]
 		
	ifFalse: [
		indexArray := IntegerArray ofSize: 4.

		" Make all of the new points "
		c := ((vertices at: (ind at: 1))+(vertices at: (ind at: 2)))/2.0.
		b1 := vIndex. vertices at: vIndex put: c. vIndex := vIndex + 1.
		c := ((vertices at: (ind at: 1))+(vertices at: (ind at: 3)))/2.0.
		b2 := vIndex. vertices at: vIndex put: c. vIndex := vIndex + 1.
		c := ((vertices at: (ind at: 1))+(vertices at: (ind at: 4)))/2.0.
		b3 := vIndex. vertices at: vIndex put: c. vIndex := vIndex + 1.
		c := ((vertices at: (ind at: 2))+(vertices at: (ind at: 3)))/2.0.
		b4 := vIndex. vertices at: vIndex put: c. vIndex := vIndex + 1.
		c := ((vertices at: (ind at: 3))+(vertices at: (ind at: 4)))/2.0.
		b5 := vIndex. vertices at: vIndex put: c. vIndex := vIndex + 1.
		c := ((vertices at: (ind at: 4))+(vertices at: (ind at: 2)))/2.0.
		b6 := vIndex. vertices at: vIndex put: c. vIndex := vIndex + 1.

		indexArray at: 1 put: (ind at: 1).
		indexArray at: 2 put: b1.
		indexArray at: 3 put: b2.
		indexArray at: 4 put: b3.
		self split: indexArray depth: dp-1.

		indexArray at: 1 put: b1.
		indexArray at: 2 put: (ind at: 2).
		indexArray at: 3 put: b4.
		indexArray at: 4 put: b6.
		self split: indexArray depth: dp-1.

		indexArray at: 1 put: b2.
		indexArray at: 2 put: b4.
		indexArray at: 3 put: (ind at: 3).
		indexArray at: 4 put: b5.
		self split: indexArray depth: dp-1.

		indexArray at: 1 put: b3.
		indexArray at: 2 put: b6.
		indexArray at: 3 put: b5.
		indexArray at: 4 put: (ind at: 4).
		self split: indexArray depth: dp-1.
		]

