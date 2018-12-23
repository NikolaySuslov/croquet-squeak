waiting
wait
	"Wait unconditionally for this reference to resolve."
	| sema |
	sema := Semaphore new.
	self whenResolved:[sema signal].
	sema wait.