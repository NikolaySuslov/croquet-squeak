initialize
makeSides
	| s g |
	sides := OrderedCollection ofSize: 6.
	1 to: 6 do:[: groupIndex |
		g := TGroup new.
		1 to: 8 do:[:index |
		
			s := TRectangle new.
			s materialAndTexture: matNorm.
			s solid: false.
			s normal: nil. " this allows the user to select from both sides"
			index <= 4 ifTrue:[ s objectName: #doCorner:.]
			ifFalse:[s objectName: #doEdge:.].
			g addChild: s.
			].
		sides at: groupIndex put: g.
		self addChild: g.
		].
	(sides at: 1)rotationAroundX:-90.
	(sides at: 2)rotationAroundX: 90.
	(sides at: 3)rotationAroundY:-90.
	(sides at: 4)rotationAroundY: 90.
	(sides at: 5)rotationAroundY:180.
