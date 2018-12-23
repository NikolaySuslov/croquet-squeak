events
pointerDown: event
	"Position it"
	| menu item |
	menu := TMenuFrame new.
	item := menu addItem: 'Item with submenu'.
	item subMenu: ((TMenuFrame new)
		addList: #(
			('Item A' #yourself)
			('Item B' #yourself)
			('Item C' #yourself)
			('Item D' #yourself)
		) target: self;
		yourself).
	menu addSeparator.
	item := menu addItem: 'Checked item'.
	item checked: true.
	item := menu addItem: 'Disabled item'.
	item disabled: true.
	item := menu addItem: 'Item with icon'.
	item icon: (CIconLibrary default at: #DefaultEventIcon).
	menu addSeparator.
	item := menu addItem: 'Item with submenu'.
	item subMenu: ((TMenuFrame new)
		addList: #(
			('Item A' #yourself)
			('Item B' #yourself)
			('Item C' #yourself)
			('Item D' #yourself)
		) target: self;
		yourself).
	menu addSeparator.
	"Add an entire list"
	menu addList: #(
		('Item 1' #yourself)
		('Item 2' #yourself)
		('Item 3' #yourself)
		('Item 4' #yourself)
		('Item 5' #yourself)
		('Item 6' #yourself)
		('Another submenu' (
			('Item A' #yourself)
			('Item B' #yourself)
			('Item C' #yourself)
			('Item D' #yourself)
			('Another submenu' (
				('Item A' #yourself)
				('Item B' #yourself)
				('Item C' #yourself)
				('Item D' #yourself)
				('Another submenu' (
					('Item A' #yourself)
					('Item B' #yourself)
					('Item C' #yourself)
					('Item D' #yourself)
					('Another submenu' (
						('Item A' #yourself)
						('Item B' #yourself)
						('Item C' #yourself)
						('Item D' #yourself)
					))
				))
			))
		))
		-
		('close menu' yourself)
	) target: self.

event shiftPressed ifTrue:["puts menu in replica frame"
	menu translationX: -3 y: 3 z: -3.0.
	event avatar carrying: menu.
] ifFalse:["puts menu next to object"
	menu translation: self globalPosition + event avatar globalPosition * 0.5.
	menu rotationAroundY: event avatar yaw.
	self root addChild: menu.
].