display
displayImage
	"Display the current image"
	| image form fileName displayString |
	fileName := imageFolder fullNameFor: imageName.
	image := [Form fromFileNamed: fileName] on: Error do:[:ex| 
		displayString := fileName asString, ex description.
		ex return: nil].
	form := self displayForm.
Transcript show: form extent.
Transcript show: '
'.
	form fillWhite.
	"This won't look great, but hey..."
	image ifNotNil:[image displayScaledOn: form].
	displayString ifNotNil:[
		displayString asDisplayText displayOn: form.
	].
	self invalidate.
	self forceDisplayUpdate.