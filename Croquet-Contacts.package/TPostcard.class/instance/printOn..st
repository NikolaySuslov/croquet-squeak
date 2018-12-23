printing
printOn: aStream

	super printOn: aStream.
	routerAddress ifNotNil:[ aStream print: routerAddress; nextPutAll: ' : '.].
	aStream
		print: routerID;
		nextPutAll: ':';
		print: routerName;
		nextPutAll: '-';
		print: viewpointName.
