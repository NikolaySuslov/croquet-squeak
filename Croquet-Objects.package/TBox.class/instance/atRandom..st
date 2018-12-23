accessing
atRandom: segments

	| dm |
	dm := (maxCorner - minCorner)/segments.
	^ Vector3 x:(dm x * (segments atRandom) + minCorner x) 
				y:(dm y * (segments atRandom) + minCorner y)
				z:(dm z * (segments atRandom) + minCorner z).
