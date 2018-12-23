private
droppedEventStreamOfSize: sizeNeeded
	self priorEvent ifNil:[
		^(WriteStream on: (Array new: sizeNeeded+1))
			nextPut: self;
			yourself
	] ifNotNil:[
		^(self priorEvent droppedEventStreamOfSize: sizeNeeded+1) 
			nextPut: self;
			yourself.
	].