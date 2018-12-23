initialize
validateFaceGroups
	"Check to see if all face groups are valid. For debugging only."
	| vtxSize face |
	vtxSize := self vertices size.
	self normals ifNotNil:[
		self normals size = vtxSize ifFalse:[self error:'normal size mismatch'].
	].
	self texCoords ifNotNil:[
		self texCoords size = vtxSize ifFalse:[self error:'texture size mismatch'].
	].
	self colors ifNotNil:[
		self colors size = vtxSize ifFalse:[self error:'color size mismatch'].
	].
	self faceGroupsDo:[:fg|
		fg basicSize \\ 3 = 0 ifFalse:[self error:'Face group not divisable by 3'].
		1 to: fg basicSize do:[:i|
			face := fg basicAt: i.
			(face >= 0 and:[face < vtxSize]) ifFalse:[self error:'Vertex out of range'].
		].
	].