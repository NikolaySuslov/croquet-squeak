as yet unclassified
setup
	| pc sync entry island |
	
	contactBroadcaster := TBroadcasterStandalone reset default.
	super setup.
	harness enableIslandCache: false.
false ifTrue:[
	island := harness createIsland: IntroWorld named: 'Intro World'.
	entry := self registerPortal: #mainEntry in: island.
] ifFalse:[
	island := harness createIsland: IntroWorld named: 'Intro World'.
	entry := self registerPortal: #mainEntry in: island.
	self registerPortal: #T3BodyPortal in: island.
	harness makeSnapshot: (island future at: #mainEntry) angle: 0 
		translation:(Vector3 x: 0 y: 0 z: 0).

	island := harness createIsland: T3BodyWorld named: '3Body World'.
	self registerPortal: #IntroPortal in: island.
	harness makeSnapshot: (island future at: #mainEntry) angle: 11 
		translation:(Vector3 x:11.27770042419434 y:10.25 z:100.1538009643555).

	island := harness createIsland: DungeonWorld named: 'Dungeon World'.
	self registerPortal: #IntroPortal in: island.
	harness makeSnapshot: (island future at: #mainEntry) angle: 11 
		translation:(Vector3 x:16.52985000610352 y: -32.47652435302734 z: -103.7088470458984).

	island := harness createIsland: MarsWorld named: 'Mars World'.
	self registerPortal: #IntroPortal in: island.
	harness makeSnapshot: (island future at: #mainEntry) angle: 15
		translation:(Vector3 x:21.26738166809082 y: -17.4773292541504 z:38.1824035644531).

	island := harness createIsland: UnderwaterWorld named: 'Underwater World'.
	self registerPortal: #IntroPortal in: island.

	island := harness createIsland: SpreadSheetWorld named: 'Spreadsheet World'.
	self registerPortal: #IntroPortal in: island.
	harness makeSnapshot: (island future at: #mainEntry) angle: -40
		translation:(Vector3 x: -6.16044044494629 y:0.25 z:8.65220928192139).
].
	"Drop into the intro world"
	pc := entry future postcard.
	pc whenResolved:[
		sync := harness  viewPortal future postcardLink: pc value.
		sync whenResolved:[harness startRender]. "ready to render"
	].
	pc wait.
