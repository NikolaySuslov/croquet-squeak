events
fireSelectedItem: event
	"Fire the selected menu item"
	selectedItem ifNil:[^nil].
	selectedItem fireWithEvent: event. "any action associated with it"
	selectedItem subMenu ifNil:[^self topMenu close]. "after firing"
