display
displayNextImage
	| fileNames nextIndex |
	fileNames := (imageFolder fileNamesMatching: '*.gif;*.jpg;*.bmp;*.png') asArray sort.
	nextIndex := (fileNames indexOf: imageName) \\ fileNames size + 1.
	imageName := fileNames at: nextIndex.
	self displayImage.