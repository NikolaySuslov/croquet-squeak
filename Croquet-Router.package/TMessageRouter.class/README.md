I route incoming messages from croquet clients.

Instance variables:
	logStream		<Stream>						My log stream
	clients			<Array of TMessageClient>	My Croquet clients that I handle
	eventQueue	<SharedQueue>				The event queue for handling messages
	eventLoop		<Process>					The process executing the event queue
	facets			<Dictionary>					The facets defined for the router
	lastTick		<Integer>						The millisecond clock value for the last message sent
	timeStamp		<Float>						The current time stamp for the island
	autoStop		<Boolean>					If true, close the router when the last client goes away
	upstream		<TRemoteController>		The backend to the proxy I am the frontend for, or nil if I'm a root router
