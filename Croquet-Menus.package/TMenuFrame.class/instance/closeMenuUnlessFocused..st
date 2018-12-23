events
closeMenuUnlessFocused: aMenu
	"Close aMenu unless it is focused"
	aMenu isFocused ifFalse:[aMenu close].
