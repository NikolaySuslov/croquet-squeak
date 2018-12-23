accessing
pick: pointer

" We are here because we already picked the top level boundSphere, so we know that is true. We just need to figure out where we clicked on the sphere."
	^ pointer pickSphere: 0@0@0 radiusSquared: boundSphere radiusSquared.
