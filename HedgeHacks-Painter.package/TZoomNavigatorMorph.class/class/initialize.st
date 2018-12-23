as yet unclassified
initialize
	"TZoomNavigatorMorph initialize"
	BackButtonForm := self loadIcon2: 'BackButton.gif'.
	ProjectsForm := self loadIcon2: 'Projects.gif'.
	AliceForm := self loadIcon2: 'Alice.gif'.
	SnapshotForm := self loadIcon2: 'Snapshot.gif'.
	ToolsForm := self loadIcon2: 'Tools.gif'.
	ToolFormLibrary := Dictionary new.
	#(TSpaceBrowser TConnectionDialog TPainter) do:[:each|
		ToolFormLibrary at: each put: (self loadIcon2: each,'.gif').
	].