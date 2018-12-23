accessing
startColor: col

"This requires either a Vector4 or a Color4 "
	startColor := col asVectorColor.
	self updateVars.