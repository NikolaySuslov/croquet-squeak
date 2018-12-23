initialize
initialize
	super initialize.
	mode := GLTriangleStrip.
	baseRadius := 0.5.
	topRadius := 0.0. "default is a cone"
	height := 1.0.
	slices := 8.
	stacks := 4.
	capTop := true.
	capBase := true.
	self materialList: {TMaterial new}.