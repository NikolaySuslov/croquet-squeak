regression-tests
test3
	"Multi fork really rocks! This tests checks your concurrecy speed. If you get something like:
26.Aug.2003-23:29:23 <I> ShockTest 'Trying to crash me1'
26.Aug.2003-23:29:23 !!!  <I> ShockTest 'Trying to crash me2'
26.Aug.2003-23:29:23 !!!  <I> ShockTest 'Trying to crash me3'
26.Aug.2003-23:29:23 !!!  <I> ShockTest 'Trying to crash me4'
26.Aug.2003-23:29:23 !!!  <I> ShockTest 'Trying to crash me5'
26.Aug.2003-23:29:24 !!!  <I> ShockTest 'Trying to crash me6'
26.Aug.2003-23:29:24 <I> ShockTest 'Trying to crash me7'
26.Aug.2003-23:29:25 <I> ShockTest 'Trying to crash me8'

your computer is ok
If you get
26.Aug.2003-23:29:23 <I> ShockTest 'Trying to crash me1'
26.Aug.2003-23:29:23 !!!  <I> ShockTest 'Trying to crash me2'
26.Aug.2003-23:29:23 !!!  <I> ShockTest 'Trying to crash me3'
26.Aug.2003-23:29:23 !!!  <I> ShockTest 'Trying to crash me4'
26.Aug.2003-23:29:23 !!!  <I> ShockTest 'Trying to crash me5'
26.Aug.2003-23:29:24 !!!  <I> ShockTest 'Trying to crash me6'
26.Aug.2003-23:29:24 !!!  <I> ShockTest 'Trying to crash me7'
26.Aug.2003-23:29:25 !!!  <I> ShockTest 'Trying to crash me8'
Your computer is slow and some race condition can happen!
	"
	| lc |
	lc := LogClient for: 'ShockTest'.

	[ lc info:'Trying to crash me1'. ] fork.		
	[ lc info:'Trying to crash me2'. ] fork.	
	(Delay forMilliseconds:40	) wait.	
	[ lc info:'Trying to crash me3'. ] fork.		
	(Delay forMilliseconds:80	) wait.	
	[ lc info:'Trying to crash me4'. ] fork.		
	(Delay forMilliseconds:160	) wait.	
	[ lc info:'Trying to crash me5'. ] fork.	
	(Delay forMilliseconds:340	) wait.
	[ lc info:'Trying to crash me6'. ] fork.	
	(Delay forMilliseconds:440	) wait.
	[ lc info:'Trying to crash me7'. ] fork.	
	(Delay forMilliseconds:840	) wait.
	[ lc info:'Trying to crash me8'. ] fork.	