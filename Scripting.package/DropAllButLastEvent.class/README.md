This exception can be signaled by an event handler to drop all but the last event currently executed by a handler. In other words, a handler of the form:

onFoo: arg
	<on: foo>
	DropAllButLastEvent signal.
	Transcript cr; show: arg.

that is invoked using:

	self signal: #foo with: 1.
	self signal: #foo with: 2.
	self signal: #foo with: 3.

would first be executed with argument 1 but upon signaling DropAllButLastEvent re-evaluate the handler with *only* the last event.
