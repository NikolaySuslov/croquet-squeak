accessing lists
deny: anObject
	whitelist remove: anObject ifAbsent: [].
	blacklist add: anObject