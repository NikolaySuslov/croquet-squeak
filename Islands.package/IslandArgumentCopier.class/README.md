IslandArgumentCopier is responsible for converting arguments passed between islands. The following 'styles' of argument passing are currently supported:

#passByProxy: 
	Will pass a (far) proxy to the object (default).

#passByCopy: 
	Will pass a copy of the object.

#passByClone: 
	An optimized version of passByCopy: for objects which do not reference themselves.

#passByIdentity:
	Will pass the object directly. Note that passByIdentity: objects have various restrictions on what they are allowed to do and what not most of which are currently not enforced since we're still in an experimental stadium. Use with extreme caution.