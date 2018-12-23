initialize
reinstall

	| frame rad ext |
	inReinstall ifTrue:[^ self]. "don't recurse"
	inReinstall := true.
	frame := frameChildren at: 1.

	rad := frame octreeRadius.
	inBox := frame octreeBox.
	outBox := TBox new.
	quadCenter := inBox center.
	qtTL:= nil.
	qtTR:= nil.
	qtBL:= nil.
	qtBR:= nil.
	spheres := nil.
"----- size is 1/2 of the length of a quadtree side. -----"
	ext := inBox extent.
	quadSize := ext x > ext z ifTrue:[ ext x ] ifFalse:[ext z].
	"size := size > ext y ifTrue:[ size ] ifFalse:[ext y]. don't need for quadtrees"
	quadSize := quadSize/2.0.
	quadSize < rad ifTrue:[ quadSize := rad.].
	quadCorner := quadCenter - quadSize.
	radius := 0.0.
	depth := 5.
	self visible: false.

	frameChildren do:[ :fc |
			fc octreeSieve: self.].
	boundSphere := TBoundSphere localPosition: outBox center radius: outBox diagonal/2.0.
	boundSphere frame: self.

	inReinstall := false.