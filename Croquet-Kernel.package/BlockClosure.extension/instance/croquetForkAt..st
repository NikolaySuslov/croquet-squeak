*Croquet-Kernel
croquetForkAt: priority 
	"Create and schedule a Process running the code in the receiver at the given priority. Answer the newly created process."

	^ self croquetNewProcess
		priority: priority;
		resume