display
redraw
	"We don't keep enough state here to redraw anything so just clear the background"
	self displayForm fillWhite.
	self invalidate.
	self forceDisplayUpdate.