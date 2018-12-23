parsing
makeTextureUV: args
	textureUV add: (Vector2
						u: (args at: 2) asNumber
						v: 1.0 + (0.0 - (args at: 3) asNumber)).