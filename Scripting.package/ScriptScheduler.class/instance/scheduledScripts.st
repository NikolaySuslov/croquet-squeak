accessing
scheduledScripts
	^Array streamContents:[:s|
		self scheduledScriptsDo:[:p| s nextPut: p].
	].