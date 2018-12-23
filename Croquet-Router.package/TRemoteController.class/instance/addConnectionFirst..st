router switching
addConnectionFirst: aConnection
"Add aConnection to the list of fallback connections. It will be the first one to try if we need to switch"

	^ self critical: [connections add: aConnection after: connection]