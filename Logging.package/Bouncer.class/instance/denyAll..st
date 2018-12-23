accessing lists
denyAll: aCollection
	aCollection do: [:ea | self deny: ea]