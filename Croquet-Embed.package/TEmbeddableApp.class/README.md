(c) 2006 Qwaq Inc. TEmbeddableApp is the (abstract) superclass for all embeddable (2D) Croquet applications. Subclasses must provide sufficient initialization (via #newFrom:), process events (via the event methods) and update their display.

Instance variables:
	app		<TFarRef to: TEmbeddedApp>	A reference to the embedded app.
	userID	<TObjectID>	The id of the local user used by events.
	display	<TForm>		The display TForm.
	extent	<Point>		The extent of the app.