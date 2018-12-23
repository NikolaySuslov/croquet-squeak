shaders
reportedShadingLanguageVersion

	^[ (self glGetString: GLShadingLanguageVersion) fromCString ]
		on: Error 
		do: [ :ex | '0.0 Error thrown OpenGl version may be too old.' ]