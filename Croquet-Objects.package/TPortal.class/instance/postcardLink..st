accessing
postcardLink: pc

	pc ifNil:[postcard :=  self] ifNotNil:[ postcard := pc. ].
