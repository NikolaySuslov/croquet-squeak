server
stopServer
	"Stop the server process"
	server ifNotNil:[server terminate].
	server := nil.