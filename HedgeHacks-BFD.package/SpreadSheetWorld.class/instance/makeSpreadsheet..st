initialize
makeSpreadsheet: worldExtent
	^TEmbeddedApp name: #TMorphicWorld extent: worldExtent 
		data: {#makeMorph:. SpreadSheet}.