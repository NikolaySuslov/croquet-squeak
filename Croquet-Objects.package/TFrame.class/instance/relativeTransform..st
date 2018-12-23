transform
relativeTransform: frame

	^ self globalTransform orthoNormInverse * frame globalTransform.