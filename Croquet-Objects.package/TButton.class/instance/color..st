accessing
color: col
	color := col.
	frame colorize: color.
	frame2 ifNotNil:[frame2 colorize: color.].
