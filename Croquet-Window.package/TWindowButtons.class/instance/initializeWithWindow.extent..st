accessing
initializeWithWindow: win extent: ext

	| tframe tframe2 |

"----------------------- goto button -----------------"

	tframe := TButton createNewWithFileName: (FileDirectory pathFromURI: 'Content/Widgets/arrow.ASE') scale: 1.0.
	gotoButton := TButton new initializeWithFrame: tframe.
	gotoButton target: win action: #gotoWindow:.

"----------------------- kill button ------------------"
	tframe := TButton createNewWithFileName: (FileDirectory pathFromURI: 'Content/Widgets/cross.ASE') scale: 0.5.
	killButton := TButton new initializeWithFrame: tframe.
	killButton rotationAroundZ: 45.0.
	killButton target: win action: #killWindow.

"---------------------- open close button ---------------"
	tframe := TButton createNewWithFileName: (FileDirectory pathFromURI: 'Content/Widgets/cross.ASE') scale: 0.5.
	tframe2 :=  TButton createNewWithFileName: (FileDirectory pathFromURI: 'Content/Widgets/minus.ASE') scale: 0.5.
	openButton := TButton new initializeSwitchWithFrame: tframe
		frame2: tframe2.
	openButton target: win action:#openContents.
	openButton target2: win action2:#closeContents.

"------------------------ grab button --------------------"
	tframe := TButton createNewWithFileName: (FileDirectory pathFromURI: 'Content/Widgets/HandOpen.ASE') scale: 0.6.
	tframe2 := TButton createNewWithFileName: (FileDirectory pathFromURI: 'Content/Widgets/HandClosed.ASE') scale: 0.6.
	grabButton := TButton new initializeSwitchWithFrame: tframe frame2:tframe2.
	grabButton target: win action: #grabWindow:.
	grabButton target2: win action2: #releaseWindow:. 
	grabButton rotationAroundZ: 180.0.

"--------------------- camera button -----------------------"
	tframe := TButton createNewWithFileName: (FileDirectory pathFromURI: 'Content/Widgets/camera.ASE') scale: 0.6.
	cameraButton := TButton new initializeWithFrame:tframe.
	cameraButton target: win action: #snapshotWindow:.

	extent := ext.
	self addChild: grabButton.
	self addChild: gotoButton.
	self addChild: killButton.
	self addChild: openButton.
	self addChild: cameraButton.
	self showCloseButton.
	self extent: extent.
	^self
