initialize
setupMaster
	| space sync island portal spc pc rportal rpc portal3D rspace rspc rIsland |

	island := self createIsland: SimpleWorld named: 'Master'.

	space := island future at: #masterSpace.
	portal := island future at:#portal1.
	portal3D := island future at:#portal3D.
	spc := space future postcard.
	pc := portal future postcard.
	
	spc whenResolved:[
		self addIsland: island postcard: spc value.
		


	rIsland := self createIsland: RecurseWorld named: 'Recurse'.
	rspace := rIsland future at: #recurseSpace.
	rspc := rspace future postcard.
	
	rportal := rIsland future at: #portal1.
	
	rpc := rportal future postcard.

	pc whenResolved:[
		rpc whenResolved:[
			self addIsland: rIsland postcard: rpc value.
			portal future postcardLink: rpc value.
			rportal future postcardLink: pc value.
		].
	].

	rspc whenResolved:[
		portal3D future postcardLink: rspc value.
	].



	sync := viewPortal future postcardLink: spc value.
		sync whenResolved:[doRender := true]. "ready to render"

	]
