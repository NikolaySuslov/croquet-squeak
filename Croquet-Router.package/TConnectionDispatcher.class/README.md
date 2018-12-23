This class takes incoming Croquet connection requests and transfers them to the appropriate router. Subclasses must implement the specific mapping required.

Instance variables:
	socket		<Socket>		The server socket accepting the incoming connections.
	server		<Process>	The process handling incoming connections.
	mutex		<TMutex>	Mutex to get exclusive access to the dispatcher.
	sessions		<Dictionary>	The mapping from session ID to router.
	autoCreate	<Boolean>	If true, non-existing sessions are automatically created.

Class variables:
	Default		<TSessionDispatcher>	The default session dispatcher (if any)
	Port			<Integer>	The port for the default session dispatcher
