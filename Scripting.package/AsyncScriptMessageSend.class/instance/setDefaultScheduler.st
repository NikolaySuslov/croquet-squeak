private
setDefaultScheduler
	myIsland := Processor activeIsland.
	myScheduler := myIsland scheduler ifNil:[Processor activeProcess scheduler].