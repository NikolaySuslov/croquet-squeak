initialize
initialize
	| space sky |

	Processor activeIsland id: self class islandID.
	space := TSpace new.
	space registerGlobal: #mainEntry.
	self makeLight: space.
	self makeFloor: space fileName:'lawn.BMP'.

"
	waveDemo := self makeWaveDemo: space.
	self makeWaveDemo: waveDemo at: -30@-1@-30 in: space.
	self makeWaveDemo: waveDemo at: 30@-1@-30 in: space.
	self makeWaveDemo: waveDemo at: 30@-1@30 in: space.
	self makeWaveDemo: waveDemo at: -30@-1@30 in: space.
	self world doOneCycleNow.
"
	self makeKay: space.
	self makeMirror: space. 
	self makePyramid: space.

	self makeUnderwaterPortal: space.
"	self makePopUp: space.	"
	self makeChess: space.
	self makeProjectLink: space.
	self makeFlash: space.
"	self makeGalleryPortal: space."
	self makeDungeonPortal: space.
	self make3BodyPortal: space.
	self makeSpreadSheetPortal: space.
	self makeMarsPortal: space.

	Smalltalk at: #QwaqWorld 
		ifPresent:[:qWorld| self makeQwaqPortal: space using: qWorld].
	Smalltalk at: #QwaqWorldRemote
		ifPresent:[:qWorld| self makeQwaqPortalRemote: space using: qWorld].

	sky := TSkyBox new initializeWithFileName: 'JUL'.
	sky step. "get going"
	space addChild: sky.

	^space