as yet unclassified
sendBuffer
	"Send the buffer, reset timer, empty buffer."

	self sendMessage: buffer contents.
	timer := DateAndTime now asSeconds + 60.
	buffer := String new writeStream