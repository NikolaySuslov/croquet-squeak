printing
printClient: aClient
	| s |
	s := WriteStream on: (String new: 20).
	aClient ifNil: [s nextPutAll: 'nil'] ifNotNil: [
		aClient address do:[:octet| s print: octet] separatedBy:[s nextPut: $.].
		s nextPut: $:.
		s print: aClient port.
	].
	^s contents