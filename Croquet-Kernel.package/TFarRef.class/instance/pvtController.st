private
pvtController

	^myController
		ifNil: [
			(myController := myIsland controller)
		]