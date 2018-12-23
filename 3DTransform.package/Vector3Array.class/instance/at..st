accessing
at: t1 
	| t2 |
	t2 := ZeroVertex shallowCopy.
	t2
		replaceFrom: 1
		to: 3
		with: self
		startingAt: t1 - 1 * 3 + 1.
	^ t2