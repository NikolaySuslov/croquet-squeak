initialize
setupLocal
	| localController sop |

	localController := TLocalController new.
	localController join. 	"request messages"
	localController heartbeat: 20.
	self addController: localController.
	systemIsland := localController newIsland.

	"make a portal inside the local island"
	viewPortal := systemIsland future new: TPortal.
	systemIsland future at: #portal put: viewPortal.

	"make system overlay inside the local island"
	systemOverlay := systemIsland future new: TSystemSpace.
	systemOverlayPortal := systemIsland future new: TPortal.
	sop := systemOverlay future postcard.

	sop whenResolved:[
		
		systemOverlayPortal future postcardLink: sop value.
		self addIsland: systemIsland postcard: sop value.
	].
"	island future at: #systemOverlay put: systemOverlay."
	postcard := TPostcard new routerAddress: nil "don't know what it is"
				id: nil "don't know what it is"
				name: 'Master' 
				viewpointName: #masterSpace.
	viewPortal future postcardLink: postcard.