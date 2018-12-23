access
logAccessEntry: aMessage on: aStream
"writes in Apache Common Log Format: http://httpd.apache.org/docs/2.0/logs.html"

	aStream nextPutAll: (aMessage senderHostString ifNil: '-'); space.
	aStream nextPutAll: (aMessage senderName ifNil: '-'); space.
	aStream nextPutAll: (aMessage userName ifNil: '-'); space.
	self logDateApache: aMessage on: aStream. aStream space.
	aStream nextPut: $";
		nextPutAll: (aMessage request ifNil: ['-']);
		nextPutAll: '" '.
	aStream nextPutAll: (aMessage status ifNil: '-'); space.
	aMessage size ifNil: [aStream nextPutAll: '- '] ifNotNil: [aStream print: aMessage size].
