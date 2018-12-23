router tests
loginGuest: aController
	"Log in as guest"
	| promise |
	promise := aController login: self guestLogin password: self guestPassword.
	promise wait.

	self assert: aController status == #ready.

	"Required facets"
	self assert: (aController facets includesKey: #join).
	self assert: (aController facets includesKey: #sync).
	self assert: (aController facets includesKey: #heartbeat).
	self assert: (aController facets includesKey: #leave).
