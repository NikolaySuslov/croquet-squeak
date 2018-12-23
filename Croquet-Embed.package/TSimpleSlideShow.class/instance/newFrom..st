initialize
newFrom: appData
	imageFolder := FileDirectory on: (FileDirectory pathFromURI: appData).
	self displayFirstImage. 