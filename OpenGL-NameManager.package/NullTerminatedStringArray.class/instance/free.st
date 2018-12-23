initialization
free

	(pointers isNil and: [externalStrings isNil]) ifTrue:
		[^ self "Nothing to free."].

	externalStrings do: [:string | string free].
	pointers := nil.
	externalStrings := nil.