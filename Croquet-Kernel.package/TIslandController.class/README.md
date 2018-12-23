I control an island's execution.

Instance variables:
	status			<Symbol>			A symbol indicating the status of the controller:
		#closed			- Unconnected
		#connecting		- Trying to connect to a router
		#authenticating	- Authenticating a user
		#ready				- Connected and ready to use.
		#invalid			- Something went really, really wrong.
	log				<Stream>			A log stream for debug messages.
	island			<TIsland>			The island I am responsible for.
	eventQueue	<SharedQueue of MessageSend>	The shared queue holding the messages for
															the event loop.
	eventLoop		<Process>		The process handling messages in the queue.
	networkQueue	<SharedQueue of TMessageData>	The queue of messages to send into the island
	facets			<Dictionary>		A dictionary storing two kinds of data on facets, depending on key:
		<TObjectID -> MessageSend>	Maps a facet ID to a message and reciever to invoke
		<Symbol -> TObjectID>			Maps a convenient name to a facet ID (not necessarily
											one I understand)
	mutex			<TMutex>			The mutex used to gain exclusive access to an island.
	senderID		<TObjectID>		This controller's sender ID.