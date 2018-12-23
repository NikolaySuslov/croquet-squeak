accessing
cacheDirectory
	| fd |
	fd := FileDirectory default directoryNamed: 'cache'.
	fd assureExistence.
	^fd