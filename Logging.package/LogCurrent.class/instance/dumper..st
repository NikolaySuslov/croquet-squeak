public
dumper: anObject
"Log anObject using its custom log dumper method"
	 
	self isIgnore ifFalse: [ 
		anObject logDumperOn: stream 
		self endEntry.		
	]