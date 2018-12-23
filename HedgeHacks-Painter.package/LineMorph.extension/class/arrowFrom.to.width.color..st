*HedgeHacks-Painter
arrowFrom: startPoint to: endPoint width: lineWidth color: aColor

	^ (PolygonMorph vertices: {startPoint. endPoint}
			color: aColor borderWidth: lineWidth borderColor: aColor) makeForwardArrow