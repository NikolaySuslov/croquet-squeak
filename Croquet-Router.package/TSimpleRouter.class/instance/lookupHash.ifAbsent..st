login
lookupHash: userHash ifAbsent: aBlock
	^passwords at: userHash ifAbsent: aBlock