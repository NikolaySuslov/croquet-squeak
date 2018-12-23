login
addUserName: usrName password: password
	| userHash passHash |
	userHash := TCryptoRandom hashMessage: usrName.
	password isString 
		ifTrue:[passHash := TCryptoRandom hashMessage: password] 
		ifFalse:[passHash := password].
	^self addUserHash: userHash passHash: passHash