initialize
makeControlButtons
	| button |
	window frame collapseButton delete.
	"window frame addMorphBack: window frame closeButton."
	button := self makeControlButton: '?' after: window frame closeButton.
	self runScript: #makeLibrary when:{button. #fire}.
	button := self makeControlButton: 'save' after: button.
	self runScript: #initiateSaveImage when:{button. #fire}.

	"button := self makeControlButton: '<' after: window frame alphaSlider.
	self runScript: #gotoPrevCostume when:{button. #fire}.
	button := self makeControlButton: '+' after: button.
	self runScript: #insertCostume when:{button. #fire}.
	button := self makeControlButton: '>' after: button.
	self runScript: #gotoNextCostume when:{button. #fire}."