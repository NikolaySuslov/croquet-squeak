actions
advanceTo: newTime
  
	island ifNil:[^nil]. "we are probably still sync-ing"
	self processMessages. "process all the messages thus far"
	island send:[:obj| obj advanceTo: newTime].