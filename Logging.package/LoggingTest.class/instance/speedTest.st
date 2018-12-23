as yet unclassified
speedTest
	
	"not a test but code for making speed comparisons.
	the SUnit test runners do not 'yet' have performance reporting
	speed* seems like a sensible prefix to use for this"
	
	| out  time |
	
	out := WriteStream on: (String new: 100).
	
	time  := [100000 timesRepeat: [
	out reset.
	out nextPutAll: ('hello' , 'test' , 'the', 'world')
	]] timeToRun.

	^ time