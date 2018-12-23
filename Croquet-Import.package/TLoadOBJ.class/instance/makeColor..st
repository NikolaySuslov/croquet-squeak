parsing
makeColor: args

	^ VectorColor
			r: args second asNumber
			g: args third asNumber
			b: args fourth asNumber
			a: 1.0