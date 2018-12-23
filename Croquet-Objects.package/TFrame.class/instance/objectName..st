accessing
objectName: oName
	self signal: #nameChanged.
	objectName := oName.
