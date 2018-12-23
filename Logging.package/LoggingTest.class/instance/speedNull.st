as yet unclassified
speedNull
	| out  time |
	
	out := WriteStream on: (String new: 100).
	time  := [100000 timesRepeat: [
	out reset.
	(null << 'hello' << 'test' << 'the' << 'world') "contents do: [ :each | out nextPutAll: each ]"
	]] timeToRun.

	^ time 

	 