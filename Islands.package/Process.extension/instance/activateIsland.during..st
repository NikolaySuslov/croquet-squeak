*Islands
activateIsland: anIsland during: aBlock
"Set my island to anIsland for the duration of aBlock. Answers the value of aBlock.

If an exception is raised during aBlock, any exception handlers will be evaluated in the context of anIsland, even those below me in the stack. For better exception handling behavior, use #activateIslandWithEscape:during:"

	| priorIsland |
	priorIsland := self island.
	^ [self island: anIsland. aBlock value]
		ensure: [self island: priorIsland]