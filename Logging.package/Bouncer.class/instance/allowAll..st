accessing lists
allowAll: aCollection
	aCollection do: [:ea | self allow: ea]