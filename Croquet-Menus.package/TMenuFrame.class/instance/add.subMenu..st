constructing
add: aString subMenu: aMenu
	| item |
	item := self addItem: aString.
	item subMenu: aMenu.
	^item