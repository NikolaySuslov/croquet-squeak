TPortal is used to connect and see between TSpace objects. A TPortal has a link to another TPortal which in turn is embedded in another space. If the TPortal is linked back to itself, which is the default, it is treated as a mirror.

toPortal (deprecated - replaced with viewPoint).
viewPoint - the viewPoint frame or portal that this portal is connected to. This can actually be any kind of TFrame, or it could even be a TSnapShot. The default viewPoint is self which is a mirror.
outVector - normal vector for TPortal
lastCameraPosition - last camera position used by testEnter:. If we are in front of the portal, and then behind it, we enter the portal.
blocked - boolean determines if use can enter the portal
locator - address to load contents of portal from
cameraDistance - used to sort the portals back to front.
camera - every portal has its own camera when rendering through. 
overlaySpace - this is a TSpace with a few subtle differences. 
viewPoint - use this when the frame you want to link to is in the same Island.
DAS