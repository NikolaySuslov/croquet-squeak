Croquet Harness is the minimal interface to the underlying support infrastructure. It is used to manage changes in screen real estate, and track events to vector to Croquet. 

userID - a unique TObjectID which identifies a particular user.
dispatcher -
controllers - collection of controllers that we have created that are connected to both the local and remote routers.
contactPoint - finds all of the local broadcasting routers via their own contectPoints.
formMgr - the default TFormManager. used to manage TForms.
cacheMgr - default TFileCachManager.
avatar - TAvatarUser
ogl - the OpenGL object, which is the interface to OpenGL.
viewPortal - the main viewing portal into the current space of interest
postcard - a TPostcard that is a reference for the rendered viewpoint.
bounds - the 2D bounds of the viewing space
systemOverlayPortal - overlay portal supporting the system overlay space
systemOverlay - system overlay space
systemIsland - the non-replicated Island containing the system overlay content
readyToRender - semaphore flag indicating that we can now render
renderProcess - a render process fork.
doRender - boolean indicating we can begin rendering
viewPoints - a listing of all the FarRe f viewpoints that are referenced by portals.
eventPointer - a TPointer used during rendering to determine user interactions with 3D objects.
event - a CroquetEvent object used to pass events to event processing objects inside of Croquet
yellowButtonPressed - boolean indicating yellow mouse button is pressed.
redButtonPressed - boolean indicating red mouse button is pressed.
overlays - array of overlay spaces passed to system to be rendered.
islandsByName - Dictionary used to look up Croquet Islands by their name.
islandsByID - Dictionary used to look up Croquet Islands by their ID.
enableIslandCache - enables checkpoint caching of Islands to disk.
snapshots - create image snapshots of current space.
windowData - holds a copy of a generic TWindow.

DAS