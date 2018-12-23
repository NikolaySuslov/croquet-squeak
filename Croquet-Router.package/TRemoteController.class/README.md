This island controller uses a remote message router. For security reasons, a controller is generally set up with two bits of information: a "session key" (used for encryption with the router) and a "list facet" which the controller can use to list other available facets. How to actually transfer those two bits of information is what makes my subclasses and the associated routers special. In the simplest case, we might just use no encryption (no session key) and a well-known list facet. In a more realisitic case, however, we would use either encryption or out-of-band techniques (email, https) to get this information across. However, since in general we expect there to be *some* form of authentication, TRemoteController provides the method login:password: as a generic entry point (which then needs to be implemented by the subclasses properly).

Instance variables:
	connection		<TMessageRelay>	The primary connection to a router
	connections	<OrderedCollection of TMessageRelay>	All connections that we could use to transmit
	sessionID		<TObjectID>			The id of the island I'm connected to
	promises		<Dictionary: TObjectID -> TPromise>	Dictionary mapping reply facets
																to TPromises to resolve
	sentMessages	<Dictionary>			Measuring the start time of messages.
	sentCounter	<SmallInteger>		A message ID counter.
	latencyStats	<Bag>					A bag full of latency stats.
	messageStats	<Bag>					A bag full of message stats.
	cacheManager	<TCacheManager>	A cache manager to deliver the resources for this island
	backDoor		<TMessageRouter>	The back-door to the message router if hosted on the same machine.
	url				<>
	downstream	<TMessageRouter>	The frontend to the proxy I am the backend for, or nil if I'm a regular client
	isServer		<Boolean>			True if I'm willing to serve sync and resource requests; false otherwise
	heartbeat		<Integer>				The rate, in milliseconds, at which I'd like the router to update my clock,
											or nil if I don't need that
