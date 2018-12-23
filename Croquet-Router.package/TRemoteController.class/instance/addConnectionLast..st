router switching
addConnectionLast: aConnection
"Add aConnection to the list of fallback connections. It will be the last one to try if we need to switch"

	^ self critical: [connections add: aConnection before: connection]