as yet unclassified
reset		"WebServer reset"
	"Reset the default WebServer instance."

	Default ifNotNil:[
		Default destroy.
		Default := nil.
	].