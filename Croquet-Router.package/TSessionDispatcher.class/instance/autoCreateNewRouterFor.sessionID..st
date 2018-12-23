dispatching
autoCreateNewRouterFor: aSocket sessionID: aSessionID
	| router |
	self autoCreate ifFalse:[^self errorNoNewRouterFor: aSocket sessionID: aSessionID].
	router := self defaultRouterClass new.
	router autoStop: true. "for auto routers we destroy them programmatically, too"
	router dispatcher: self.
	^router