*HedgeHacks-Morphic
leaveTeaProject

	self world triggerEvent: #aboutToLeaveWorld.
	self finalExitActions.
	self makeThumbnail.
	ProjectHistory remember: self.
	self abortResourceLoading.
	self world triggerClosingScripts.
	self saveProjectPreferences.
