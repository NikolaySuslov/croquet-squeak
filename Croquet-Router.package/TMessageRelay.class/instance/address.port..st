connecting
address: hostName port: portNum
	"Connect me to the router"
	hostName isString
		ifTrue:[address := NetNameResolver addressForName: hostName]
		ifFalse:[address := hostName asByteArray].
	port := portNum.
