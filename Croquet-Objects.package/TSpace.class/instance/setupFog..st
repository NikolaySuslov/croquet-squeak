render
setupFog: ogl
	
	ogl
		fogOn:true;
		glFogi: GLFogMode with: GLExp;
		glFogfv: GLFogColor with:  (self fogColor asFloatArray);
		glFogf: GLFogDensity with: fogDensity;
		glHint: GLFogHint with: GLDontCare;
		glFogf: GLFogStart with: fogStart;
		glFogf: GLFogEnd with: fogEnd.
