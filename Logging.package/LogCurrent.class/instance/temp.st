levels
temp
"Lowest priority: 11 of 11:
fatal panic emergency alert critical error warn notice info debug TEMP
This is the default level"

	Preferences enableTemporaryDebugMessages ifFalse: [ ^ self ignore ].

	category := nil.
	level := #temp