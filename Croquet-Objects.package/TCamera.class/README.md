The TCamera is used to generate an image of the scene from a particular location in a TSpace. It does the majority of setting up OpenGL to render. 

The z value of the camera matrix actually points away from the direction of view. This seems to be a standard approach for OpenGL. 

instance variables:

bounds
bounds is the area that is rendered into. You can set this (#bounds:) to have an explicit hard value. This is a 2D bounds.

viewAngle
This is the view angle of the camera measured top to bottom. The default is 45 degrees, which means that the angle of the top and bottom edges of the rendered image are 45 degrees apart.

* zNear, zFar
The near and far clipping planes in the graphics engine. 

zScreen
This is the z distance from the camera that the virtual screen would be. That is, when you have an x,y location on the real screen, you can add the zScreen value (x,y,zScreen) and normalize which gives you an accurate pointing vector in 3D space.

length (deprecated)
Computed by initClipPlanes and used to render the test camera.

clipPlanes, clipPlanesTransform
clipPlanes are the four frustum clip planes defined in the cameras local orientation.
clipPlanesTransform are the four clipPlanes in the cameras global orientation frame. This is what is used to determine if objects are visible inside of the view frustum.

viewClip (deprecated)
This is used to test the visibility culling of the camera. It makes the clipping planes visible. This is obsolete, but it may be useful again if we ever start playing with the object clipping code again. 

portalClip
This is an additional clip plane defined by a portal. Objects on the near side of the portal need to be clipped away as well. This is a 4x4 transform.

portalPlane
This is a 3D vector calculated from the portalClip.

inPortal
A flag indicating whether we are rendering a portals contents from this camera or not. This is used to supress certain tests (such as finding floors), and to determine that the avatar should or should not be rendered.

currentSpace
The space we are currently inside of and rendering from. 

texture (deprecated)
Simply a texture that gets added to the default rendered camera. Not used anymore unless you really need to see the default camera. 

killFrame
A flag to indicate that the current rendered image is junk and should not be rendered. This suppresses a swapBuffers call.

cornerVector
This is a normalized vector pointing to the top right corner of the screen in 3-space. That is, width/2,height/2,zScreen. The cornerVector value is used as an easy way to find a corner of the screen in 3-space. It is computed from the bounds width, height, and zScreen values as follows:
	cornerVector := ((bounds width/2.0)@(bounds height/2.0)@(zScreen negated)) normalized.

DAS






 