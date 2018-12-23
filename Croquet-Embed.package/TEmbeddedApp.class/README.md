(c) 2006 Qwaq Inc. TEmbeddedApp acts as a target for embedding any kind of "external" applications in Croquet. It communicates the events to the embedded app and displays the output of the app. Depending on whether the app supports its own synchronization protocol, the resulting display may be synchronized or not. Some apps do some will not. If they don't (like TSimpleSlideShow) it is a good idea to disallow other users to communicate with the app, e.g., filter the events such that only the local user can interact with the app. 

Embedded apps can utilize Croquet messaging in a limited form. Since they have a reference to the (replicated) app, sending (replicated) future messages to that app can be used to communicate between the individual instances. Notably, the app can #signal: events that other replicas can listen and respond to (either via other #signals: or via out-of-bounds messages). See TSlideShowApp for an example of how to synchronize the previously unsynchronized simple slide show.

Usage: To create an embedded app you typically provide the name, the extent, and the (app specific) initialization data. Some apps do not require initialization data (THelloWorldApp) some do (TSlideShowApp). When you have created the app you can use it (for example) as the content pane for a window:

	app := TEmbeddedApp name: #TSlideShowApp extent: 400@300 data: 'Content/Textures'.
	win := TWindow new.
	win contents: app.
	space addChild: win.

Instance variables:
	appName	<Symbol>	The name under which this app is registered.
	appData		<Object>		Custom data associated with the app.
	appID 		<TObjectID>	The unique ID for identifying this instance of the app.
	appExtent 	<Point>		The (virtual) extent used for mapping input.

	onscreenRate 	<Integer>	The update rate when the app is visible (being rendered)
	offscreenRate	<Integer>	The update rate when the app is invisible (not being rendered)
	stepRate		<Integer>	Current update rate of the app (internal use only)
