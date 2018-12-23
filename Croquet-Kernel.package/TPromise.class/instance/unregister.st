initialize
unregister
	Processor activeIsland globals removeKey: myName ifAbsent:[]. "eeek!!!"
	self pauseScript: #resolve:.