actions
sendMessage: msg
	"Send the message, e.g., put it into the network queue"
	self stampMessage: msg.
	self dispatchMessage: msg.