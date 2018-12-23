accessing
setLifetimeFrom: from to: to

	lifetimeRange := from to: to.
	1 to: size do:[:index | pLifetime at: index put: (lifetimeRange max atRandom).].
	self updateVars.
