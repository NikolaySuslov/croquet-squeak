accessing
updateArea: aRectangle with: aForm
	"the form contains new data to copy into the rectangle area specified"
	| fixBlt |
	fixBlt := BitBlt toForm: aForm.
	fixBlt combinationRule: 40 "fixAlpha:with:".
	fixBlt halftoneForm: (Bitmap with: 16rFF000000).
	fixBlt destRect: fixBlt clipRect; copyBits.

	form copy: aRectangle from: 0@0 in: aForm rule: Form over.
	self invalidate: aRectangle.
	