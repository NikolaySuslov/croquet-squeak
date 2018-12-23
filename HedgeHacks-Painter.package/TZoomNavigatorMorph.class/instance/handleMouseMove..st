event handling
handleMouseMove: anEvent
	"We need mouseMove even if no button is pressed"
	(anEvent hand hasSubmorphs) ifTrue:[^self].
	anEvent wasHandled: true.
	self mouseMove: anEvent.