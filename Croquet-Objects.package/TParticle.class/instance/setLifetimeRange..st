accessing
setLifetimeRange: range

	lifetimeRange := range.
	1 to: size do:[:index | pLifetime at: index put: (lifetimeRange max atRandom).].
	self updateVars.
