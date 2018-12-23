parsing
loadTexture: fileName

	^ TTexture new initializeWithFileName: fileName mipmap: true shrinkFit: false