router tests
loginAdmin: aController
	"Log in as admin"
	| promise |
	promise := aController login: self adminLogin password: self adminPassword.
	promise wait.

	self assert: aController status == #ready.

	"Required facets"
	self assert: (aController facets includesKey: #join).
	self assert: (aController facets includesKey: #send).
	self assert: (aController facets includesKey: #sync).
	self assert: (aController facets includesKey: #heartbeat).
	self assert: (aController facets includesKey: #beServer).
	self assert: (aController facets includesKey: #leave).
	self assert: (aController facets includesKey: #timeStamp).
