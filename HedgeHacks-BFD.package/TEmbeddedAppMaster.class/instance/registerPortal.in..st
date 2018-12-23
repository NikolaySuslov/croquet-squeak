initialize
registerPortal: portalName in: island
	| entry pc |
	entry := island future at: portalName.
	pc := entry future postcard.
	pc whenResolved:[harness addIsland: island postcard: pc value.].
	^entry