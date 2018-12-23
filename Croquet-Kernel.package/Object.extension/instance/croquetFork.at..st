*Croquet-Kernel
croquetFork: aSelector at: aPriority
	| aProcess |
	aProcess :=  [self perform: aSelector] croquetForkAt: aPriority.
	aProcess name: self class name,'>>', aSelector.
	^aProcess