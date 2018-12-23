constructing
addMenuItem: aMenuItemSpec
	menuItems := menuItems copyWith: aMenuItemSpec.
	self changed.