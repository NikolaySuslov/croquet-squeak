OGLExtManager handles OpenGL extension functions for OGL. Since extensions are specific for particular renderer/drivers all extensions must be looked up dynamically. I provide the technical means to handle extensions transparently for any number of contexts.

Declaring Extensions:
========================
Extension functions (and constants) have to be specifically declared. To declare functions and constants for an extension you need to do the following:
#1: Go to the CLASS side of OGLExtManager and add a category that has the same name as listed in glGet(GL_EXTENSIONS). For example, to use the ARB imaging extension this category must be named GL_ARB_imaging (even though the extension is referred to as 'ARB imaging' glGet will tell us that the name GL_ARB_imaging so that is what you need to use).
WARNING: The name must match EXACTLY, no extra spaces, watch for small and capital letters etc.

#2: Add a method which initializes the constants in this extension. The method itself MUST follow the convention to begin with 'initialize' and should then use the extension name. E.g., for initializing the constants in the ARB_imaging it should be called 'initializeArbImaging'.

The constants itself can be initialized by just copying them from the spec describing them and use the provided utility methods for initialization (just look over a few existing extensions). I am trying to make it easy for you to just copy those constants.

Note that all constants appear ONLY in the GLExtConstants - OpenGLConstants is exclusively used for standard OpenGL constants.

#3: Add the functions the extension defines. Generally, these should just be plain ffi call methods but there are three important issues:
	a) NEVER provide a 'module' for these functions. Since they are looked up by opengl specific means other ways are used and you MUST NOT provide a module. The extension this particular function is contained in is defined by the category and not by the module (this is to prevent confusion about 'I have no GL_ARB_imaging.dll' or even worse the possibility that on some system any such thing even exists (!)).
	b) NEVER do anything but just the plain FFI call (optionally followed by a plain return or call to #externalCallFailed). The method you are writing will actually be run in an entirely different place - you are only providing a template for the sake of your convenience (and speed). If you need more sophisticated error handling do this in the place where you call the method or provide a helper in OGL or something similar, but NEVER EVER DO THIS HERE.
	c) The calling convention is effectively ignored. Since it is platform specific it will in fact be replaced by the appropriate OS calling convention when used.

#4: Evaluate 'OGLExtManager initialize' which will add the constants to GLExtConstants and compile forwarder methods in OGL.

Using Extensions:
====================
Once you declared the extension, using it is simple. Since the constants defined by the extension are accessible through the GLExtConstants pool, you can just refer to them by name.

To invoke an extension method you simply invoke it via ogl, e.g., in order to invoke the 'glUnlockArraysEXT' function you would use something like:
	ogl glUnlockArraysEXT
etc.

IMPORTANT: You must never ever attempt to create a OGLExtManager explicitly. The OGLExtManager is transparently wrapped in OGL.

Implementation details:
===========================
In order to implement the dynamic lookup mechanism in the most convenient way, the OGLExtManager is always created as a 'unique subclass' of OGLExtManager. That is when you ask for a new extension manager using 'OGLExtManager new' you actually get a subclass of OGLExtManager which is denoted by an asterisk in front of it so it looks as *OGLExtManager.

The *OGLExtManager does not understand any of the function you have provided. When it runs into a message which it doesn't understand it performs the following functions:
1: First it looks if that method is in fact an extension method you defined.
2: If it is, it looks if the extension this method belongs to is present in the renderer it is bound to (e.g., the OGLExtManager's ogl inst var)
3: If the extension is present it looks at the functions you declared for this extension, and for each function
	- it copies the template method
	- it looks up calling convention / address of the function
	- it installs a new ffi call spec for that method
	- it adds this method to *OGLExtManager
4: Once all the function for the extension have been loaded it reinvokes the message which failed.

Preloading extensions:
=========================
As you can see from the implementation details, there is a certain overhead involved in handling extensions. In particular, there can be a noticable speed impact when an extension is loaded 'on demand' (e.g., when a message is not understood). To compensate for this, extensions can be loaded explicitly, by using, e.g.,
	ogl loadExtension: #'GL_ARB_imaging'.

Providing extensions as changesets:
=========================================
When creating a changeset to add a particular OpenGL extension, you should not include any of the auto-generated changes (neither methods nor constants) to OpenGL, GLExtConstants, or OGLExtManager.  In particular, including the changed GLExtConstants class definition will cause those who load the changeset to lose the constants for other extensions they may have loaded.

Instead, only include the initialization methods on the class side of OGLExtManager (eg: #initializeArbVertexProgram and #generateArbVertexProgramFunctions), and perhaps a test for the extension in OpenGL (eg: OpenGL>>hasArbVertexProgram).  Use code in the changeset postscript to generate extension functions and constants.  Continuing with the vertex program example, the postscript might look like this:

"Postscript:
Generate extension functions and initialize extension constants. Use a temporary changeset so we do not clutter up this one. And provide initials to prevent asking the user"

Utilities useAuthorInitials: 'generated' during: [
	| cs |
	cs _ Utilities useChangeSetNamed: 'generated' during: [
		OGLExtManager 
			generateArbVertexProgramFunctions;
			initialize].
	cs preambleString: '"catch-all changeset for generated functions"'.
]