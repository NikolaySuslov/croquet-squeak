constructing
addItem: aString
	| item |
	item := TMenuItem new.
	item label: aString.
	self addMenuItem: item.
	^item