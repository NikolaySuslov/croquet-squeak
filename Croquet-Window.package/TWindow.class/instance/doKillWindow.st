actions
doKillWindow

	frameParent removeChild: self.
	contents ifNotNil:[ 
		contents isPortal ifTrue:[ 
			contents kill.
			contents := nil.
			].
		].

