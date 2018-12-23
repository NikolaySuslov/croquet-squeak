accessing
printOn: aStream
	self address do:[:x| aStream print: x] separatedBy:[aStream nextPut: $.].
	aStream nextPut: $:.
	aStream print: self port.
	aStream print:' '.
	aStream print: self id.
	aStream nextPut: $:.
	aStream print: self name.

