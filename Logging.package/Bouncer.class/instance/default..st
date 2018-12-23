accessing lists
default: anObject
	whitelist remove: anObject ifAbsent: [].
	blacklist remove: anObject ifAbsent: [].
