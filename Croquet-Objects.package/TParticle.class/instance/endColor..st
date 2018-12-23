accessing
endColor: col

"This requires either a Vector4 or a Color4 "
	endColor := col asVectorColor.
	self updateVars.