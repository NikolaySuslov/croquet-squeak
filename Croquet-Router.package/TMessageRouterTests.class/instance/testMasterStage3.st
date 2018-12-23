router tests
testMasterStage3
	"Create a server island"
	| island pt ref xx yy promise |
	self testMasterStage2.
	promise := controller join.				"receive messages"
	promise wait.
	controller heartbeat: 1000.
	controller beServer.			"act as server"
	island := controller newIsland. "Create a new island handled by the controller"
	pt := island future new: Point.
	pt future setX: 123 setY: 456.
	ref := island future at: #testPoint put: pt.
	ref wait.
	self assert: ref isResolved.

	island send:[:obj| pt := obj at: #testPoint].
	pt send:[:obj|
		xx := obj x.
		yy := obj y.
	].
	self assert: xx = 123.
	self assert: yy = 456.
