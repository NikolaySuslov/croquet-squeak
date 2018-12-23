accessing
uid: aUUID
	uid ifNotNil:[^self error: 'Cannot change uid'].
	uid := aUUID.