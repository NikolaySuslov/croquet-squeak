events
pointerOver: event
	| pt appExtent idx evtFrame |
	evtFrame := event selection frame.
	(evtFrame = menuTxtr) ifTrue: [
		pt := event selection point x @ event selection point y.
		pt := pt / (menuTxtr extent) + 0.5.
		appExtent := menuTxtr extent * 100.
		pt := pt * appExtent.
		pt := pt x @ (appExtent y - pt y).
		idx := (pt y - 3) / (self menuItemFont height + 3) + 1.
		self selectItemIndex: (idx truncated min: menuItems size max: 0).
	].