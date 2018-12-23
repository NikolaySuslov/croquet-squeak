accessing
scale: scale
	super scale: scale.
	arrowLength := scale * arrowLength.
	radius := scale * radius.
	length := scale * length.