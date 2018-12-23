comparing
= other
	^ (self sid = other sid
		and: [self time = other time]
		and: [self id = other id]
		and: [self sender = other sender])
		and: [self receiver = other receiver]
		and: [self selector = other selector]
		and: [self arguments = other arguments]
