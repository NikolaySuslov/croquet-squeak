*Croquet-Misc
addCroquetMimeTypes
	#(
		(mpg	('video/mpeg' 'audio/mpeg'))
	) do:[:spec|
		StandardMIMEMappings at: spec first asString put: spec last.
	].