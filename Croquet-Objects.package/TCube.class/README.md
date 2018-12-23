"TCube generates and renders a simple cube. It is one of the simplest objects that we have."
	-- DAS

TCube2 is a mesh-based replacement for TCube... using meshes instead of display lists will greatly simplify rendering with shaders.

Eventually we might want to have one set of geometry shared by all cubes (use the transform matrix to differentiate TCubes), but it's not worth the time right now.

'uvScale' is a hack until we start using the texture matrix.