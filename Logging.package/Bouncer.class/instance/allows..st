testing
allows: anObject
	(blacklist includes: anObject) ifTrue: [^ false].
	(whitelist includes: anObject) ifTrue: [^ true].
	^ defaultAllow