accessing
category
	category ifNotNil: [^ category].
	sender ifNil: [^ nil].
	^ sender receiver class theNonMetaClass name