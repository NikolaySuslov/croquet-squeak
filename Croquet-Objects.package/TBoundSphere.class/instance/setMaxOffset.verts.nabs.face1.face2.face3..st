render
setMaxOffset: m verts: verts nabs: nabs face1: face1 face2: face2 face3: face3
   | ray t  |
		ray := self ray: m tri: localPosition - (verts at: 1+face1)
					tri: localPosition - (verts at: 1+face2)
					tri: localPosition - (verts at: 1+face3).
		
		ray ifNotNil:[ 
			nabs x > nabs y 
				ifTrue:[
					nabs x > nabs z 
						ifTrue: [t := ray x/normal x] 
						ifFalse: [ t := ray z/normal z]
					]
				ifFalse:[
					nabs y > nabs z 
						ifTrue:[t := ray y/normal y] 
						ifFalse:[t := ray z/normal z]
					].
			t abs > offset abs ifTrue: [ offset := t negated.]
		]
