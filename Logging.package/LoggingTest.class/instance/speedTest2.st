as yet unclassified
speedTest2
	| out  time |
	
	out := WriteStream on: (String new: 100).
	
	time  := [100000 timesRepeat: [
	out reset.
	out nextPutAll: 'hello'.
	out nextPutAll: 'test'.
	out nextPutAll: 'the'.
	out nextPutAll: 'world'
	]] timeToRun.

	time
	