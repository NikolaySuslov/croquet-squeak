writer
sendData: aBuffer count: size
	"Send a buffer worth of data"
	socket sendData: aBuffer count: size.
	sendAmount := sendAmount + size.