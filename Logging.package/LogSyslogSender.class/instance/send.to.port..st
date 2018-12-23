private
send: message to: host port: port
	"Send formatted UDP message to host and port."

	| sock |
	sock := Socket newUDP.
	sock setPeer: NetNameResolver localHostAddress port: port.
	sock sendData: message.
	sock waitForSendDoneFor: Socket standardDeadline.
	sock close