messaging
send: selector

	"TFarRef compatability"
	selector isBlock ifTrue: [^ selector value: self].

	^self send: selector withArguments: #()