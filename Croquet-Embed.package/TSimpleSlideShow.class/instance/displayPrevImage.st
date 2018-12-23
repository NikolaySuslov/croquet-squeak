display
displayPrevImage
	| fileNames nextIndex |
	fileNames := (imageFolder fileNamesMatching: '*.gif;*.jpg;*.bmp;*.png') asArray sort.
	nextIndex := ((fileNames indexOf: imageName) - 2) \\ fileNames size + 1.
	imageName := fileNames at: nextIndex.
	self displayImage.