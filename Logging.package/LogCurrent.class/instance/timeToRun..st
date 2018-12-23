public
timeToRun: aBlock
	| time |
	[time := Time millisecondsToRun: aBlock]
		ensure: [self time: time] "use the dnu to output 'time: 1'"