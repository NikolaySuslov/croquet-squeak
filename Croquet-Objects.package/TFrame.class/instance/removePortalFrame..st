frameManagement
removePortalFrame: prtlFrm

	frameParent ifNotNil:[frameParent removePortalFrame: prtlFrm.]