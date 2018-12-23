I represent a single message (datagram).

Instance variables:
	receiver	<TObjectID>	The receiver's id.
	selector		<Symbol>	The message selector.
	arguments	<ByteArray>	The message arguments (encoded!)
	sender		<TObjectID>	The sender's (machine) id.
	msgId		<TObjectID>	The id for this message (to be signaled upon completion)
	time		<Float>		The time (in seconds) when this message should be run
	sid			<Integer>	The sequence id for this message