events
switch: bool

	switch := bool.
	(frame visibleTree or:[frame2 visibleTree])ifTrue:[
		frame solidVisibleTree: switch not.
		frame2 solidVisibleTree: switch.
	].
