I relay messages on a socket.

Instance variables:
	address		<ByteArray>			The ip address of the connection.
	port			<Integer>			The port for the connection.
	socket		<Socket>				The relay socket.
	stream		<SocketStream>		The socket stream for easier decoding.
	buffer		<ByteArray>			The buffer for send operations.
	eventQueue	<SharedQueue>		The queue for scheduling further messages.
	outQueue	<SharedQueue>		The queue for outgoing messages.
	reader		<Process>			The reader process
	writer		<Process>			The writer process
	recvCypher	<StreamCypher>		The stream cypher for receiving messages
	sendCypher	<StreamCypher>		The stream cypher for sending messages
	facets		<Dictionary>			The facets defined for this relay.
	recvCount	<Integer>			Number of messages received.
	sendCount	<Integer>			Number of messages sent.
	recvAmount	<Integer>			Overall number of bytes received.
	sendAmount	<Integer>			Overall number of bytes sent.
