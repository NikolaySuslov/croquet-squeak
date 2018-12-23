A simple cache manager looking in a particular directory for some cached resource.

Instance variables:
	mutex	<TMutex>	Mutex for concurrent access.
	location	<String>		Relative uri (using forward slashes) for the cache location.