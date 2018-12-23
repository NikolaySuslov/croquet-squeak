accessing
framePointerTrans: trans

	" convert from global to local target frame coordinates. "
	framePointer := self globalTransform transposed composeWith: trans.