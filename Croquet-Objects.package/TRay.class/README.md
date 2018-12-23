TRay specifies a position and orientation, usually inherited from it's parent TFrame. Though you can modify this. It is used to determine the closest object in a particular direction and the distance to that object. 

This is a factored TPointer change set. The new TRay class is concerned only with picking an object, while the new TPointer class is a subclass of TRay, but includes the events model. This means that the TCamera uses a TRay for the downPointer, and it also makes it easier to use a TRay for arbitrary objects looking for the floor. I also completely rewrote the actual matrix math. Essentially, a TRay is a TFrame with the ability to pick. Now it actually uses the local and global orientation matrices to perform the test. 

TRay tests are fairly expensive, so be careful with them. Also, I don't think you want to use a translation with them. I think more work needs to be done to make this robust.

The way a TRay works is you simply place it as a child frame, and it will automatically get called at the next render loop. You can use it directly by calling the following methods:

#pointerPick: or 
#pointerPickFloor: 

with a TBoundSphere as the argument (which in turn points to a TFrame) as the argument. If the return is true, then the TRay intersected the object.

You can also call one of the #frame:xxxx:xxxx: messages if you know the type of object you are attempting to select. If you wish to check a number of objects and keep only the closest, call the message #testDistance:false. Make sure you call #testDistance: true when you are done.

The following variables are for internal use only:
	automatic - indicates whether a ray is tested automatically during rendering.
	framePointer - is the ray orientation relative to the object we are testing against.
	framePosition - is the ray location relative to the object we are testing against.
	sphereDistSquared - is the distance to the recently tested sphere. 
	currentFrame - this is the frame we are currently testing against.
	selection - the selected frame information. See TSelection for more information.
	doSelect - turns the selection of the TRay on/off. This is used by the TPointer to keep the pointer from selecting other objects between a mouseDown/mouseUp.
	testDistance - a boolean that allows us to ignore the current distance when testing for object intersection. It is used when the user needs to determine intersection and to a specific object.
	downRay - boolean indicates whether this is a floor test ray or not.
The following variables are for external use:
	minDistance - the minimum distance we care about.
	minDistanceSquared - the above squared for performance
	maxDistance - the furthest away we care
	maxDistanceSquared - the above squared for performance.
	frameScale - scaling value for testing picks with micro worlds.

DAS