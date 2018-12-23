access
logDateApache: aMessage on: aStream
"writes in Apache Common Log Format: http://httpd.apache.org/docs/2.0/logs.html"

	| stamp |
	stamp := aMessage stamp.
	aStream nextPut: $[;
		nextPutAll: (stamp day asString padded: #left to: 2 with: $0);
		nextPut: $/;
		nextPutAll: stamp monthAbbreviation;
		nextPut: $/;
		nextPutAll: (stamp year asString padded: #left to: 4 with: $0);
		nextPut: $:.

	stamp printHMSOn: aStream.

	aStream
		space;
		nextPut: (stamp offset positive ifTrue: [$+] ifFalse: [$-]);
		nextPutAll: (stamp offset hours abs asString padded: #left to: 2 with: $0);
		nextPutAll: (stamp offset minutes abs asString padded: #left to: 2 with: $0);
		nextPut: $]