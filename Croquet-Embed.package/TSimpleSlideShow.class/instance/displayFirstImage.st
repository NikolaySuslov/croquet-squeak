display
displayFirstImage
	| fileNames |
	fileNames := (imageFolder fileNamesMatching: '*.gif;*.jpg;*.bmp;*.png') asArray sort.
	imageName := fileNames at: 1.
	self displayImage.