waiting
wait
	"Wait unconditionally for this promise to resolve."
	| sema |
	sema := Semaphore new.
	self whenComplete:[sema signal].
	sema wait.