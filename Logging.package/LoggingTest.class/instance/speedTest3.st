as yet unclassified
speedTest3
	| out  time |
	
	out := WriteStream on: (String new: 100).
	
	time  := [100000 timesRepeat: [
	out reset.
	 #('hello' 'test' 'the' 'world') do: [ :each | out nextPutAll: each ]
	]] timeToRun.

	time