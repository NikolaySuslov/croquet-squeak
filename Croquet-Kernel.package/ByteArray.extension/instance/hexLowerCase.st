*Croquet-Kernel-printing
hexLowerCase
	| stream |
	stream := '' writeStream.
	self do: [ :each |
		stream
			nextPut: ('0123456789abcdef' at: each // 16 + 1);
			nextPut: ('0123456789abcdef' at: each \\ 16 + 1)].
	^ stream contents