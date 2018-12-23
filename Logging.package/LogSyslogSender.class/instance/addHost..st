accessing
addHost: aString
	"Add a host to send to, 514 is default syslog port."

	self addHost: aString port: 514