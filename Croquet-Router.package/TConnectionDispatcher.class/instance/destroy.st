initialize
destroy
	"Destroy the session dispatcher"
	server ifNotNil:[
		server terminate.
		server := nil.
	].
	socket ifNotNil:[
		socket destroy.
		socket := nil.
	].