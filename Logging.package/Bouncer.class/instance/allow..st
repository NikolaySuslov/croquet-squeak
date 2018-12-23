accessing lists
allow: anObject
	blacklist remove: anObject ifAbsent: [].
	whitelist add: anObject