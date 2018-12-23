accessing
appExtent: aPoint
	"Answer the application extent for this display"
	appExtent := aPoint.
	self aspect: appExtent y / appExtent x asFloat.
	self extent: appExtent * 0.01. "@@@@Magic#"
	self uvScale: (appExtent / appExtent asLargerPowerOfTwo) asFloatPoint.