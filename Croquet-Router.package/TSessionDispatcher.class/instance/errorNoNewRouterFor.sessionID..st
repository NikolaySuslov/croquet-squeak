dispatching
errorNoNewRouterFor: aSocket sessionID: aSessionID
	self error: 'Attempt to create router for ', aSocket remotePrettyString, '.'.
