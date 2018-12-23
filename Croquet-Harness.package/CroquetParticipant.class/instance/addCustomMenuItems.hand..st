menu
addCustomMenuItems: aMenu hand: aHand
	super addCustomMenuItems: aMenu hand: aHand.
	aMenu addUpdating: #showFrameRateString action: #toggleFrameRate.
	aMenu add: 'toggle full screen' action: #toggleFullScreen.
