export
exportPoint: aPoint
	dataStream nextPut: CodePoint.
	self export: aPoint x.
	self export: aPoint y.