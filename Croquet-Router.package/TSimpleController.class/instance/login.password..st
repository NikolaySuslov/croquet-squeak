initialize
login: userName password: pwd
	"Use usrName/pwd for the simple router"
	| userHash passHash |
	userHash := TCryptoRandom hashMessage: userName.
	passHash := pwd isString ifTrue:[TCryptoRandom hashMessage: pwd] ifFalse:[pwd].
	^self userHash: userHash passHash: passHash