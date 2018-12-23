accessing
uid
	^uid ifNil:[
		self uid: UUID new.
		uid]