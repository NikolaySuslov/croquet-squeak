accessing
originalAspect

	"Provide the aspect ratio of the target application,
	 so that aspect-preserving displays display the app proportionally."
	(appExtent x = 0) ifTrue: [
		 ^ super originalAspect.
	].
	^appExtent y / appExtent x asFloat 