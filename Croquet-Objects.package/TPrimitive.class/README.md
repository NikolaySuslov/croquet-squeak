TPrimitive is the base class of a lot of the simple classes such as TCube, TSphere, TRectangle. It is primarily used to help manage graphics caching.

texture - texture applied to the opaque object
textureAlpha - texture applied to the translucent object
material - material applied to the opaque object
materialAlpha - material applied to the alpha object
boundsChanged - if the boundSphere needs to be recomputed
boundSphere - minimal sphere that contains the entire object
glListID - OpenGL ID of the cached display list
oglInstance - the OpenGL instance value
cachingEnabled - flag indicating same

DAS
