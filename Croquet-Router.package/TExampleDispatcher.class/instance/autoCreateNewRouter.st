dispatching
autoCreateNewRouter
	| router |
	autoCreate ifFalse:[^self error: 'Cannot create new routers'].
	router := defaultRouterClass new.
	router autoStop: true. "for auto routers we destroy them programmatically, too"
	^router