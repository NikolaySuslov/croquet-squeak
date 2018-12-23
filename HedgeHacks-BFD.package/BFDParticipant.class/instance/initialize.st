initialization
initialize
	super initialize.
	TZoomNavigatorMorph initialize. "check for new icons"
	self extent: 600@400.
	self addZoomNavigator.