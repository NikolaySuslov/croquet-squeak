accessing
activeSpace
	"Answer the space we're currently in"
	^self findViewpointByPostcard: (viewPortal get: #postcardLink).