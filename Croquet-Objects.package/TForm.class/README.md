TForm is an imaging object that maps Squeak forms into OpenGL textures. It is also intended to act as a static Croquet object type in that it will typically not be stored as part of an Island but must be loaded either from a local cache, a remote cache, or from another user. It can also generate a thumbnail version of itself that can be copied and stored as part of a TTexture.

sha - the Secure Hash Algorithm value from the original file
form - the Squeak Form object.
updateRect - what part of the OGL texture to update.
extent - the actual original extent of the texture.
bMipmap - boolean flag, determines if mipmapping is on.
bShrinkFit - boolean flag, determines if we shrink or grow the texture to fit the proper power of two extent.
extension - extension bit flags for further bitmap processing
memUsed - the memory required to store the OGL texture.
objectID - a TObjectID
bThumb - indicates whether or not this TForm is a thumb. If it is, then it needs to be resolved to the "real" TForm, which may be either cached or located in a remote server. 

NOTE: Dynamically generated TForms (those not loaded from elsewhere) are the same as themselves. That is, they cannot really generate thumbnails.

DAS