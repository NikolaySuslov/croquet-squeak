buffer objects
generateBufferObject: bufferArray type: type mode: mode
	| holder bufferID |

	bufferArray ifNil: [ ^ nil. ]. 

	holder := WordArray new: 1.
	self glGenBuffersARB: 1 with: holder.

	bufferID := holder at: 1.
	self glBindBufferARB: type with: bufferID.
	self glBufferDataARB: type 
		with: bufferArray byteSize with: bufferArray with: mode.

	^ bufferID