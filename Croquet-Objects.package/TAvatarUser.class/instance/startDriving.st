driving
startDriving

	driving := true.
	replica future startDriving.
	self signal: #startDriving.