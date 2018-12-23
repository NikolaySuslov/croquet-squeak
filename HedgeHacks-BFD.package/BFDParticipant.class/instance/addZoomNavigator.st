zoom navigator
addZoomNavigator
	dock := TZoomNavigatorMorph new.
	dock position: self bounds bottomLeft.
	dock fullBounds. "need the layout!"
	dock width: self width.
	self addMorph: dock.
	dock mouseLeave: nil.
	dock addProjectRoot.
	dock addSnapshotRoot.
	dock addToolsRoot.
	dock addAvatarRoot.
	dock addTool: TPainter.
	"dock addTool: TSpaceBrowser.
	dock addTool: TConnectionDialog."