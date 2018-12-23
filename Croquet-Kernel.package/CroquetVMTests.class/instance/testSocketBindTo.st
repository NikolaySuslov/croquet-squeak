socket tests
testSocketBindTo
	"Test that the bind() primitive on sockets is supported"
	| socket address port |
	address := ByteArray withAll: #(127 0 0 1).
	port := 32152.
	socket := Socket newTCP.
	[
		self shouldnt:[socket bindTo: address port: port] raise: Error.
	] ensure:[socket destroy].
