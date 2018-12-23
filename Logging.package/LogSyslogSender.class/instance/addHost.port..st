accessing
addHost: aString port: aPortNumber
	"Add a host name with portnumber."

	hosts add: aString -> (aPortNumber ifNil: [514])