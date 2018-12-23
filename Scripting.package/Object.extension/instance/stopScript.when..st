*Scripting-Extensions
stopScript: aScript when: anEvent
	self startScript: #stopScript: withArguments:{aScript} when: anEvent