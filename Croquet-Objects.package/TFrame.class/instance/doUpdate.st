frameManagement
doUpdate

	frameRoot ifNotNil:[
		frameRoot addUpdate: self.
	].