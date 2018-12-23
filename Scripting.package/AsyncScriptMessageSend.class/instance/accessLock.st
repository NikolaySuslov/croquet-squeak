private
accessLock
	^accessLock ifNil:[UpdateLock critical:[
		accessLock ifNil:[accessLock := Semaphore forMutualExclusion]]].
