*Croquet-Kernel
fork: aSelector at: aPriority
	| aProcess |
	aProcess :=  [self perform: aSelector] forkAt: aPriority.
	aProcess name: self class name,'>>', aSelector.
	^aProcess