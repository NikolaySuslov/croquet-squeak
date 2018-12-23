initialize
initialize
	flag := Object new.
	tally := 0.
	mutex := Mutex new.
	array := WeakArray new: (Set sizeFor: 40).
	array atAllPut: flag.
