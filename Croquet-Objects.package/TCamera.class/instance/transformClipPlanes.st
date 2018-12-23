transform
transformClipPlanes
	|  trans |
	clipPlanesTransform := Array new: 4.
	trans := self globalOrientation.
	1 to: 4 do: [:index | 
		clipPlanesTransform at: index put: (trans localPointToGlobal: (clipPlanes at: index))].

	