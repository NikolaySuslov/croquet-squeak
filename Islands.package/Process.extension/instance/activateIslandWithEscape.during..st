*Islands
activateIslandWithEscape: anIsland during: aBlock
"Set my island to anIsland for the duration of aBlock. Answers the value of aBlock.

If an exception is raised during aBlock, any exception handlers below me in the stack will be evaluated in the old island, and any exception handlers above me will be evaluated in the new island. Due to the recursive call and my re-entrant exception handler, I guarantee this even if exceptions are thrown inside exception handlers"

	| priorIsland |
	priorIsland := self island.
	^ [self activateIsland: anIsland during: aBlock]
		on: Exception do: [:ex | ex resume: (
			self activateIslandWithEscape: priorIsland during: [
				ex rearmHandlerDuring: [ex outer]])].
