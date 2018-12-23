*HedgeHacks-Painter
traceOutline: refColor
	^Array streamContents:[:s| self traceOutline: refColor do:[:pt| s nextPut: pt]].