display
displayNextImage
	"Update my image and notify the other instances"
	super displayNextImage.
	"Note: It is important to keep in mind that the other users may not have the image with the file name we are using here. We could avoid this by broadcasting the entire image data but that would be both, way too big, and not be a very realistic example of making a non-replicated app work in Croquet. Basically, what you see here is the tradeoffs you need to deal with - and if the image isn't on the other machine, well then you won't see it."
	app future signal: #updateImage with: imageName.