private
growTo: anInteger
	"Grow the elements array and reinsert the old elements"

	| oldElements |
	oldElements := array.
	array := WeakArray new: anInteger.
	array atAllPut: flag.
	tally := 0.
	oldElements do:[:obj |
		(obj == flag or: [obj == nil]) ifFalse: [
			array at: (self findElementOrFlag: obj ) put: obj.
			tally := tally + 1.
		]
	].