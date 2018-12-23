parsing
makeVector3: fileStream

	^ Vector3
		x: (fileStream upTo: Character space) asNumber
		y: (fileStream upTo: Character space) asNumber
		z: (fileStream upTo: Character cr) asNumber