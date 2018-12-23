accessing
reportedVersion
	
	^ (self glGetString: GLVersion) fromCString "eg: '1.5 ATI-1.3.42' " 