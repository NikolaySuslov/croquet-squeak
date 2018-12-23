A TSpace object acts as the root render frame. It is the ultimate container, and is the entry point to a render tree. TSpace objects are contained in CroquetPlace objects, and can be linked via portals. 

croquetPlace - the CroquetPlace object that this TSpace belongs to.
color - the default color of the space. This is the color you see when there are no objects to render.
lightFrames - an OrderedCollection of all of the TLights in the hierarchy inside of this space.
portalFrames - an OrderedCollection of all ofthe TPortals in the hierarchy inside ofthis space.
rayFrames - an OrderedCollection of all of the TRays in the hierarchy inside of this space.
alphaObjects - a temporay OrderedCollection of the alpha objects to be drawn in each rendered frame.
currentParent - the current parent object of the frame being rendered. This is used for instanced objects.
currentTransform - the current transform of the frame.
cullBackFaces - this is a flag to turn this on and off for everything in the space.
fogOn fogStart fogEnd fogDensity - fog state variables.
ambientSound - current local sound - to be deprecated.
locator - url object.
dropInFrame - drop the TAvatar at this location when we enter the TSpace.
testRays - turn ray testing on and off (e.g. for portal rendering)
savedAlphaObjects - push the alpha objects list onto this stack if we ever recurse into the space WHILE we are rendering it. This actually happens with the TPortal3D.
viewingParticipants - participants currently viewing (rendering) the space, directly or
	through portals they view the space from.
	viewingParticipants should be members of the tea party of every object in the space
	and all of the spaces visible through portals.  When a new viewingParticipant is added
	we walk through all the frames in the space, telling them about the new participant.
	When a new child is added, we first tell it about all of the participants that are viewing
	the space containing it, so it can ensure that participant is in its tea party. 
defaultMaterial - if a TFrame object does not specify a material when it is rendering, it will use this material defined by the TSpace.

DAS