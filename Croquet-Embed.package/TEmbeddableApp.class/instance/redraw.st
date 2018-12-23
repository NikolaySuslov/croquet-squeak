display
redraw
	"Redraw the receiver. Use #invalidate: to record dirty portions and finish off with #forceDisplayUpdate to make sure your changes take effect."
	self displayForm fillWhite.
	self class name asString displayOn: self displayForm at: 10@10.
	self invalidate.
	self forceDisplayUpdate.
