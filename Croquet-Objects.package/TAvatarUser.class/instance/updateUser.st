driving
updateUser
	replica ifNil:[^nil].
	replica future driveStep.
	replica isResolved ifFalse:[^nil].
