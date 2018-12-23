events
onUpdateImage: fileName
	"Update the app to display the image with the given file name"
	imageName = fileName ifTrue:[^self]. "already showing"
	imageName := fileName.
	self displayImage.