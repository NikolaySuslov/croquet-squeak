cypher
key: key
	| buffer |
	self initKey: key.
	"Always strip off the first 1024 bytes of the key stream since they are 
	non-uniformely distributed and can been used to attack the cypher."
	buffer := ByteArray new: 32.
	1 to: 32 do:[:i| self process: buffer from: 1 to: buffer size].