menu
toggleFullScreen
	ScreenController lastScreenModeSelected
		ifTrue:[
			| priorBounds |

			priorBounds := self
								valueOfProperty: #priorBounds
								ifAbsent:[0 @ 0 corner: 640 @ 480].
			self bounds: priorBounds.
			self removeProperty: #priorBounds.

			ScreenController new fullScreenOff.
			self world positionSubmorphs.
		]
		ifFalse:[	
			ScreenController new fullScreenOn.
			self world positionSubmorphs.

			self setProperty: #priorBounds toValue: self bounds.
			self bounds: self world bounds.
			self comeToFront.
		].
