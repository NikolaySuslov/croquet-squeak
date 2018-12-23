morphic
open
	"Open an instance in the World, but you need to register it
	as an emitter too."
	
	| horizontalSplit verticalSplit verticalSplit2 |
	horizontalSplit := 0.5.
	verticalSplit := 0.3.
	verticalSplit2 := 0.9.
	selectedClasses := IdentitySet new.
	self addMorph: (
		(PluggableListMorphOfMany
			on: self
			list: #classes
			primarySelection: #selectedClass
			changePrimarySelection: #selectedClass:
			listSelection: #selectedClassesAt:
			changeListSelection: #selectedClassesAt:put:
			menu: #classMenu:)	
	) frame: (0@0 corner: horizontalSplit@verticalSplit).
	
	self addMorph: (
		(PluggableListMorph
			on: self
			list: #getSeverity
			selected: #selectedSeverity
			changeSelected: #selectedSeverity:
			menu: nil)
		autoDeselect: true) frame: (horizontalSplit@0 corner: 1@verticalSplit).

	self addMorph: (
		(PluggableListMorph
			on: self
			list: #filteredMessages
			selected: #selectedMessage
			changeSelected: #selectedMessage:
			menu: #messagesMenu:)
		autoDeselect: false) frame: (0@verticalSplit corner: 1@verticalSplit2).

	self addMorph: (
			(PluggableTextMorph on: self 
				text: #searchString accept: #searchString:
				readSelection: nil menu: nil)
			acceptOnCR: true;
			setProperty: #alwaysAccept toValue: true;
			hideScrollBarsIndefinitely )
		frame: (0@verticalSplit2 corner: 1@1).

	self setWindowColor: (Color r: 0.75 g: 0.75 b: 0.05).
	self openInWorld.
	
	^self