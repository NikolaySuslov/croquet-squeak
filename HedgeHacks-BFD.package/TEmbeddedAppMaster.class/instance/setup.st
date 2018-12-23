initialize
setup
	| pc sync entry island |
	harness := CroquetHarness new.
	harness addOverlay: self.
	island := harness createIsland: EmbeddedWorld named: 'Embedded World'.
	entry := self registerPortal: #mainEntry in: island.
	pc := entry future postcard.
	pc whenResolved:[
		sync := harness viewPortal future postcardLink: pc value.
		sync whenResolved:[harness startRender]. "ready to render"
	].
	pc wait.