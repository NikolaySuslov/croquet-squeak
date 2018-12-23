accessing
asArray
	^Array streamContents:[:s| self do:[:ref| s nextPut: ref]].