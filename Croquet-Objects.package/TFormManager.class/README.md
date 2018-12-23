The TFormManager is created in the CroquetHarness, but is also used by the OpenGL object. The reason for this is the harness is used to create Islands and their contents, and OpenGL is used to render the contents, hence the TForm objects used to generate textures must be accessible from both.

TFormManager does a number of things:

- When rendering, it will look up the real TForm in the textureDictionary when provided with a TForm thumbnail.
- If a TForm is requested that is not in the textureDictionary, TFormManager will attempt to load a new copy in the following order:
	> Check the cache directory for a local copy with the name to the sha
	> Check the URL provided as part of the thumbnail object
	> Request a copy of the texture from the originator of the island.

- When it loads a new TForm it does the following:
	> Computes an SHA hash from the file
	> Generates a new TForm object that is placed into a Dictionary that is accessed by OpenGL
	> Loads a bitmap file into a Form that is part of a TForm
	> Generates a TForm thumb object and places the SHA hash into it. This is what is actually returned from the constructor.
	> Saves a copy of the file into the local cache with the name <sha hash value>
	> Saves a copy of the file into the remote super cache with the same name.
