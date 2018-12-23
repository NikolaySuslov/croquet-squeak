initialize
initialize

	super initialize.
	mode := GLTriangleStrip.
	materialList := Array with: TMaterial new.
	self 
		normalColor: (Color r: 0.5 g: 0.7 b: 0.9 alpha: 0.7)
		highlightColor: (Color r: 1.0 g: 1.0 b: 0.2 alpha: 1.0).

	segments := 3. " number of segments/corner"
	radius := 0.25. " also 1/2 the width of the slab"
	extent := 4@4. " x-y extent of the slab."
	frontNorm := 0@0@1.
	self objectName: 'windowFrame'.
	doInside := false.
	hiliteSection := nil.
