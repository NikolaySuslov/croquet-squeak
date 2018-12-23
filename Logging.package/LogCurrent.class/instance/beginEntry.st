line-buffer
beginEntry
	"buffers grow automatically but if they get beyond bufferMax we assume that there
	 was an unusually large message and we dont want to keep our buffer at this huge size forever
	so we reset it"
	
	stream position > self bufferMax ifTrue: [ self initializeUnlimitedBuffer ].	 
	stream reset. 
 
	self temp.