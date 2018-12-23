initialize
initialize
	flag := Object new.
	tally := 0.
	array := WeakArray new: (Set sizeFor: 40).
	array atAllPut: flag.