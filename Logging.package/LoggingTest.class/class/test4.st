regression-tests
test4
	"Multi fork really rocks!"
	| lc |
	lc := LogClient for: 'ShockTest'.

	[ lc info:'Trying to crash me1'. ] fork.		
	[ lc info:'Trying to crash me2'. ] fork.		
	[ lc info:'Trying to crash me3'. ] fork.		
	[ lc info:'Trying to crash me4'. ] fork.		
	[ lc info:'Trying to crash me5'. ] fork.	
	(Delay forMilliseconds:340	) wait.
	[ lc info:'Trying to crash me6'. ] fork.	
	(Delay forMilliseconds:440	) wait.
	[ lc info:'Trying to crash me7'. ] fork.	
	(Delay forMilliseconds:840	) wait.
	[ lc info:'Trying to crash me8'. ] fork.	