I'm a connection dispatcher combining TExampleDispatcher and the KSDKDispatcher. 
I use session id's to determine the router to dispatch to, one router per session id.
I use a set of existing routers or I'll creates new routers as I see new session ids.
I also have a start at a logging protocol.
This is intended to be a production dispatcher, not sample code.

Instance variables:
	routers		<Dictionary>		Maps session IDs to routers.
	autoCreate	<Boolean>		If true, create new routers on demand.
	defaultRouterClass	<Behavior>	The default router class to use.
	log <stream>		If non nil log message to this stream.
