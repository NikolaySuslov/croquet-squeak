testing
isFocused
	"Answer whether this menu is in the active menu chain"
	^focused or:[subMenu notNil and:[subMenu isFocused]]