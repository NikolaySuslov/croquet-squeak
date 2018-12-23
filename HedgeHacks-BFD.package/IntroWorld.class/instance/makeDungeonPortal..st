initialize
makeDungeonPortal: sp
	| win pc portal |
	win := self makePortal: 'Smith.bmp'.
	win translationX: 12 y: 0.0 z: -1.0.
	sp addChild: win.
	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: DungeonWorld islandID
		"@@@@: The difference in name ('Dungeon' vs. 'Dungeon World') is quite intentional to have at least one place where we try to resolve an island exclusively by ID instead of by name. Otherwise this code will never be executed and therefore rot. @@@@"
				name: 'Dungeon'
				viewpointName: #IntroPortal.
	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #DungeonPortal.