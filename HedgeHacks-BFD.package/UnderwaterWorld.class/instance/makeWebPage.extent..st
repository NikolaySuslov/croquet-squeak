as yet unclassified
makeWebPage: url extent: pageExtent
	
	^ TEmbeddedApp name: #TMorphicWorld
						extent: pageExtent
						data: { #makeHTMLEditor: . url}.
