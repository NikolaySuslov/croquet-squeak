This is used to create a GL texture from a form, either directly or from a file.

This is dependent upon the TForm class, which handles the actual bits.

tform - this hold both a Squeak Form and the OpenGL GLID for the texture in OpenGL memory.
baseScale - 
uvScale - the uv values can be modified for certain objects like the TPrimitives and the TMesh/TLoad3DSMax. Do that here.
uvOffset - this is used by the TMesh and TLoad3DSMax objects.
mode - used when we render the texture by itself, though it can be used by anything.
uvAngle - again used by the 3DSMax importer for the TMesh objects.

isPremultiplied: if true, indicates that the texture data has premultiplied alpha,
so rendering is done with GLBlendFunc GLOne with: GLOneMinusSrcAlpha.

DAS
